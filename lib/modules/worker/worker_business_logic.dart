import 'dart:async';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../authentication/content/setup/interfaces/i_authenticatin_business_logic.dart';
import '../company/content/setup/exceptions/company_not_found_exception.dart';
import '../company/content/setup/interfaces/i_company_business_logic.dart';
import 'content/setup/interfaces/i_linked_worker_repository.dart';
import 'content/setup/interfaces/i_worker_business_logic.dart';
import 'content/setup/interfaces/i_worker_repository.dart';
import 'content/setup/exceptions/worker_not_found_exception.dart';

class WorkerBusinessLogic implements IWorkerBusinessLogic {
  late final IWorkerRepository _workerRepo = Get.find();
  late final ILinkedWorkerRepository _linkedWorkerRepo = Get.find();

  String get _currentUserId => Get.find<IAuthenticationBusinessLogic>().currentUser?.uid ?? '';
  String get _currentUserEmail => Get.find<IAuthenticationBusinessLogic>().currentUser?.email ?? '';

  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  final _currentWorker = Rx<WorkerModel?>(null);

  @override
  WorkerModel? get currentWorker$ => _currentWorker.value;

  @override
  Future<WorkerModel?> fetchCurrentWorker() async {
    _currentWorker.value = await get(_currentUserId);
    return _currentWorker.value;
  }

  @override
  void clearLoggedWorker() => _currentWorker.value = null;

  @override
  Future<WorkerModel?> get(String id) async => _workerRepo.get(id);

  @override
  Future<void> updateWorkerAsOwner(String companyId, Transaction? txn) async {
    await _workerRepo.updatePartial(
      _currentUserId,
      {'companyId': companyId, 'role': workerRoleToString(WorkerRole.owner)},
      txn: txn,
    );
    await fetchCurrentWorker();
  }

  @override
  Future<void> update(WorkerModel worker) async => await _workerRepo.update(worker);

  @override
  Future<void> create(WorkerModel worker) async =>
      await _workerRepo.create(worker.copyWith(uid: _currentUserId, email: _currentUserEmail));

  @override
  Future<void> link(String workerId, Transaction? txn) async {
    final worker = await get(workerId);
    final company = _companyBusinessLogic.currentCompany$;

    if (worker == null) throw WorkerNotFoundException();
    if (company == null) throw CompanyNotFoundException();

    final updatedWorker = worker.copyWith(companyId: company.uid, role: WorkerRole.employee);

    await _workerRepo.update(updatedWorker, txn: txn);
    await _linkedWorkerRepo.link(updatedWorker, txn: txn);
  }

  @override
  Future<void> unlink(String workerId, Transaction? txn) async {
    await _linkedWorkerRepo.unlink(workerId, txn: txn);
    final changes = {'companyId': '', 'role': workerRoleToString(WorkerRole.undefined), 'permissions': {}};
    await _workerRepo.updatePartial(workerId, changes, txn: txn);
  }

  @override
  StreamSubscription<List<WorkerModel>>? initStream({
    required RxList<WorkerModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<WorkerModel>)? onNewData,
  }) =>
      _linkedWorkerRepo.initStream(startAfter: startAfter, limit: limit).listen(
        (workerList) {
          startAfter == null ? list$.value = workerList : list$.addAll(workerList);
          onNewData?.call(workerList);
        },
      );
}

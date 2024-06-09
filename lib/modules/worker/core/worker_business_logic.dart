import 'dart:async';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class WorkerBusinessLogic implements IWorkerBusinessLogic {
  late final IWorkerRepository _workerRepo = Get.find();

  String get _currentUserId => Get.find<IAuthenticationBusinessLogic>().currentUser?.uid ?? '';
  String get _currentUserEmail => Get.find<IAuthenticationBusinessLogic>().currentUser?.email ?? '';

  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  final _loggedWorker = Rx<WorkerModel?>(null);
  final _curWorkerForUpdate = Rx<WorkerModel?>(null);

  @override
  dynamic get workerIdParmForUpdate => Get.arguments;
  @override
  WorkerModel? get loggedWorker$ => _loggedWorker.value;
  @override
  WorkerModel? get curWorkerForUpdate$ => _curWorkerForUpdate.value;

  @override
  Future<WorkerModel?> fetchLoggedWorker() async {
    _loggedWorker.value = await get(_currentUserId);
    return _loggedWorker.value;
  }

  @override
  void clearLoggedWorker() => _loggedWorker.value = null;

  @override
  Future<WorkerModel?> fetchCurWorkerForUpdate() async {
    if (workerIdParmForUpdate == null) throw Exception('Cur worker id Parameter not found');
    _curWorkerForUpdate.value = await get(workerIdParmForUpdate);
    return _curWorkerForUpdate.value;
  }

  @override
  Future<WorkerModel?> get(String id) async => _workerRepo.get(id);

  @override
  Future<void> updateWorkerAsOwner(String companyId, Transaction? txn) async {
    await _workerRepo.updatePartial(
      _currentUserId,
      {'companyId': companyId, 'role': workerRoleToString(WorkerRole.owner)},
      txn: txn,
    );
    await fetchLoggedWorker();
  }

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
    await _workerRepo.link(updatedWorker, txn: txn);
  }

  @override
  Future<void> unlink(String workerId, Transaction? txn) async {
    await _workerRepo.unlink(workerId, txn: txn);
    final changes = {'companyId': '', 'role': workerRoleToString(WorkerRole.undefined), 'permissions': {}};
    await _workerRepo.updatePartial(workerId, changes, txn: txn);
  }

  @override
  StreamSubscription<List<WorkerModel>>? initializeStream({
    required RxList<WorkerModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<WorkerModel>)? onNewData,
  }) =>
      _workerRepo.initializeStream(startAfter: startAfter, limit: limit).listen(
        (workerList) {
          startAfter == null ? list$.value = workerList : list$.addAll(workerList);
          onNewData?.call(workerList);
        },
      );

  @override
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId) async {
    WorkerModel? worker = curWorkerForUpdate$;
    worker!.togglePermission(permissionId);
    await _workerRepo.update(worker);
  }
}

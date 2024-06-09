import 'dart:async';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

// TODO Refactor
class WorkerBusinessLogic with GlobalHelper implements IWorkerBusinessLogic {
  late final IWorkerRepository _workerRepo = Get.find();

  late final IAuthenticationBusinessLogic _authBusinessLogic = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  final _loggedWorker = Rx<WorkerModel?>(null);
  final _curWorkerForUpdate = Rx<WorkerModel?>(null);
  final _linkedWorkerList$ = RxList<WorkerModel>();

  StreamSubscription<List<WorkerModel>>? _workerListSubscription;

  @override
  dynamic get workerIdParmForUpdate => Get.arguments;
  @override
  WorkerModel? get loggedWorker$ => _loggedWorker.value;
  @override
  WorkerModel? get curWorkerForUpdate$ => _curWorkerForUpdate.value;
  @override
  RxList<WorkerModel> get linkedWorkerList$ => _linkedWorkerList$;

  @override
  Future<WorkerModel?> fetchLoggedWorker() async {
    _loggedWorker.value = await get(_authBusinessLogic.currentUser!.uid);
    return _loggedWorker.value;
  }

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
    await _workerRepo.updatePartialWorker(
      _authBusinessLogic.currentUser!.uid,
      {'companyId': companyId, 'role': workerRoleToString(WorkerRole.owner)},
      txn: txn,
    );
    await fetchLoggedWorker();
  }

  @override
  Future<void> create(WorkerModel worker) async => await _workerRepo.createWorker(
        worker.copyWith(uid: _authBusinessLogic.currentUser!.uid, email: _authBusinessLogic.currentUser!.email),
      );

  @override
  Future<void> link(String workerId, Transaction? txn) async {
    final currentWorker = await get(_authBusinessLogic.currentUser!.uid);
    final worker = await get(workerId);
    final company = await _companyBusinessLogic.get(currentWorker!.companyId);

    if (worker == null) throw WorkerNotFoundException();
    if (company == null) throw CompanyNotFoundException();

    final updatedWorker = worker.copyWith(companyId: company.uid, role: WorkerRole.employee);

    await _workerRepo.updateWorker(updatedWorker, txn: txn);
    await _workerRepo.createLinkedWorker(updatedWorker, txn: txn);
  }

  @override
  Future<void> unlink(String workerId, Transaction? txn) async {
    await _workerRepo.deleteLinkedWorker(workerId, txn: txn);
    final changes = {'companyId': '', 'role': workerRoleToString(WorkerRole.undefined), 'permissions': {}};
    await _workerRepo.updatePartialWorker(workerId, changes, txn: txn);
  }

  @override
  Future<void> initializeLinkedWorkerStream() async {
    _workerListSubscription =
        _workerRepo.initializeStream().listen((workerList) => linkedWorkerList$.value = workerList);
  }

  @override
  void cancelLinkedWorkerStream() {
    _workerListSubscription?.cancel();
    linkedWorkerList$.clear();
  }

  @override
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId) async {
    WorkerModel? worker = curWorkerForUpdate$;
    worker!.togglePermission(permissionId);
    await _workerRepo.updateWorker(worker);
  }

  @override
  void clearCurrentWorker() => _loggedWorker.value = null;
}

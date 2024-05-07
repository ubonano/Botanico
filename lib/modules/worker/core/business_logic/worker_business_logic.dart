import 'dart:async';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/foundation/core/helpers/global_helper.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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
    _loggedWorker.value = await _workerRepo.get(_authBusinessLogic.currentUserId);
    return _loggedWorker.value;
  }

  @override
  Future<WorkerModel?> fetchCurWorkerForUpdate() async {
    if (workerIdParmForUpdate.isBlank) throw Exception('Cur worker id Parameter not found');
    _curWorkerForUpdate.value = await _workerRepo.get(workerIdParmForUpdate);
    return _curWorkerForUpdate.value;
  }

  @override
  Future<void> updateWorkerAsOwner(String companyId, Transaction? txn) async {
    final userId = _authBusinessLogic.currentUserId;
    await _workerRepo
        .updatePartialWorker(userId, {'companyId': companyId, 'role': workerRoleToString(WorkerRole.owner)}, txn: txn);
    await fetchLoggedWorker();
  }

  @override
  Future<void> createWorker(WorkerModel worker) async => await _workerRepo
      .createWorker(worker.copyWith(uid: _authBusinessLogic.currentUserId, email: _authBusinessLogic.currentUserEmail));

  @override
  Future<void> postCreateWorker() async {
    await fetchLoggedWorker();
    navigate.toLobby();
  }

  @override
  Future<void> linkWorker(String workerId, Transaction? txn) async {
    final currentWorker = await _workerRepo.get(_authBusinessLogic.currentUserId);
    final worker = await _workerRepo.get(workerId);
    final company = await _companyBusinessLogic.get(currentWorker!.companyId);
    if (worker == null) throw WorkerNotFoundException();
    if (company == null) throw CompanyNotFoundException();
    final updatedWorker = worker.copyWith(companyId: company.uid, role: WorkerRole.employee);
    await _workerRepo.updateWorker(updatedWorker, txn: txn);
    await _workerRepo.createLinkedWorker(company.uid, updatedWorker, txn: txn);
  }

  @override
  Future<void> postLinkWorker() async => navigate.toWorkerList();

  @override
  Future<void> unlinkWorker(String workerId, Transaction? txn) async {
    final WorkerModel? currentWorker = await _workerRepo.get(_authBusinessLogic.currentUserId);
    await _workerRepo.deleteLinkedWorker(currentWorker!.companyId, workerId, txn: txn);
    final changes = {'companyId': '', 'role': workerRoleToString(WorkerRole.undefined), 'permissions': {}};
    await _workerRepo.updatePartialWorker(workerId, changes, txn: txn);
  }

  @override
  Future<void> initializeLinkedWorkerStream() async {
    final WorkerModel? worker = await fetchLoggedWorker();
    _workerListSubscription =
        _workerRepo.linkedWorkersStream(worker!.companyId).listen((workerList) => linkedWorkerList$.value = workerList);
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

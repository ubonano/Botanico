import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class WorkerService with GlobalHelper implements IWorkerService {
  late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();

  @override
  WorkerModel? get curWorkerForUpdate$ => _workerBusinessLogic.curWorkerForUpdate$;
  @override
  WorkerModel? get loggedWorker$ => _workerBusinessLogic.loggedWorker$;

  @override
  Future<WorkerModel?> fetchCurWorkerForUpdate() async => _workerBusinessLogic.fetchCurWorkerForUpdate();

  @override
  Future<WorkerModel?> fetchLoggedWorker() async => _workerBusinessLogic.fetchLoggedWorker();

  @override
  void clearCurrentWorker() => _workerBusinessLogic.clearLoggedWorker();

  @override
  Future<void> create(WorkerModel worker) async => await operation.perform(
        operationName: 'Create worker ${worker.uid}',
        operation: (_) async => await _workerBusinessLogic.create(worker),
      );

  @override
  Future<void> link(String id) async => await operation.perform(
        operationName: 'Link worker $id',
        permissionKey: WorkerModulePermissions.linkKey,
        inTransaction: true,
        operation: (txn) async => await _workerBusinessLogic.link(id, txn),
      );

  @override
  Future<void> unlink(String id) async => await operation.perform(
        operationName: 'Unlink worker $id',
        permissionKey: WorkerModulePermissions.unlinkKey,
        inTransaction: true,
        operation: (txn) async => await _workerBusinessLogic.unlink(id, txn),
      );

  @override
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId) async => await operation.perform(
        operationName: 'Toggle permission $permissionId',
        permissionKey: WorkerModulePermissions.managePermissionsKey,
        operation: (_) async => await _workerBusinessLogic.togglePermissionCurWorkerForUpdate(permissionId),
        onSuccess: _workerBusinessLogic.fetchCurWorkerForUpdate,
      );

  @override
  StreamSubscription<List<WorkerModel>>? initializeStream({
    required RxList<WorkerModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<WorkerModel>)? onNewData,
  }) =>
      _workerBusinessLogic.initializeStream(list$: list$, startAfter: startAfter, limit: limit, onNewData: onNewData);
}

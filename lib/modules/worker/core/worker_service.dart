import 'dart:async';
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
  List<WorkerModel> get linkedWorkerList$ => _workerBusinessLogic.linkedWorkerList$;

  @override
  Future<void> createWorker(WorkerModel worker) async => await operation.perform(
        operationName: 'Create worker',
        operation: (_) async => await _workerBusinessLogic.createWorker(worker),
        onSuccess: _workerBusinessLogic.postCreateWorker,
      );

  @override
  Future<void> linkWorker(String id) async => await operation.perform(
        operationName: 'Link worker',
        permissionKey: WorkerModulePermissions.linkKey,
        inTransaction: true,
        operation: (txn) async => await _workerBusinessLogic.linkWorker(id, txn),
        onSuccess: _workerBusinessLogic.postLinkWorker,
      );

  @override
  Future<void> unlinkWorker(String id) async => await operation.perform(
        operationName: 'Unlink worker',
        permissionKey: WorkerModulePermissions.unlinkKey,
        inTransaction: true,
        operation: (txn) async => await _workerBusinessLogic.unlinkWorker(id, txn),
      );

  @override
  Future<void> initializeLinkedWorkerStream() async => await operation.perform(
        operationName: 'Fetch workers',
        permissionKey: WorkerModulePermissions.viewKey,
        operation: (_) async => await _workerBusinessLogic.initializeLinkedWorkerStream(),
      );

  @override
  void cancelLinkedWorkerStream() => _workerBusinessLogic.cancelLinkedWorkerStream();

  @override
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId) async => await operation.perform(
        operationName: 'Toggle permission $permissionId',
        permissionKey: WorkerModulePermissions.managePermissionsKey,
        operation: (_) async => await _workerBusinessLogic.togglePermissionCurWorkerForUpdate(permissionId),
        onSuccess: _workerBusinessLogic.fetchCurWorkerForUpdate,
      );

  @override
  Future<void> fetchCurWorkerForUpdate() async => _workerBusinessLogic.fetchCurWorkerForUpdate();

  @override
  Future<void> fetchLoggedWorker() async => _workerBusinessLogic.fetchLoggedWorker();
}

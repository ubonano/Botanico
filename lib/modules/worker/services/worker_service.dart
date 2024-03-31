import 'dart:async';
import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WorkerService extends GetxService with ContextService {
  final WorkerRepository _workerRepository = Get.find();

  Future<List<WorkerModel>> getAllLinkedWorkers() async {
    if (!session.workerIsLoaded) await session.fetchWorker();
    return await _workerRepository.getAllLinkedWorkers(session.companyId);
  }

  Future<WorkerModel?> getWorker(String id) async => await _workerRepository.get(id);

  Future<void> createWorker(WorkerModel worker) async {
    final workerUpdated = worker.copyWith(uid: session.userUID, email: session.userEmail);
    await _workerRepository.create(workerUpdated);
  }

  Future<void> linkWorker(WorkerModel worker, {Transaction? txn}) async {
    final updatedWorker = worker.copyWith(companyId: session.companyId, role: WorkerRole.employee);

    await _workerRepository.link(session.companyId, updatedWorker, txn: txn);
    await updateWorker(updatedWorker, txn: txn);
  }

  Future<void> unlinkWorker(String workerId, {Transaction? txn}) async {
    await _workerRepository.unlink(session.companyId, workerId, txn: txn);

    final changes = {'companyId': '', 'role': workerRoleToString(WorkerRole.undefined)};

    await _workerRepository.updatePartial(workerId, changes, txn: txn);
  }

  Future<void> togglePermission(WorkerModel worker, String permissionId) async {
    final updatedPermissions = _togglePermissionInMap(worker.permissions, permissionId);
    final modifiedWorker = worker.copyWith(permissions: updatedPermissions);

    await updateWorker(modifiedWorker);
  }

  Map<String, bool> _togglePermissionInMap(Map<String, bool> permissions, String permissionId) {
    if (permissions.containsKey(permissionId) && permissions[permissionId] == true) {
      permissions.remove(permissionId);
    } else {
      permissions[permissionId] = true;
    }
    return permissions;
  }

  Future<void> updateWorker(WorkerModel worker, {Transaction? txn}) async =>
      await _workerRepository.update(worker, txn: txn);
}

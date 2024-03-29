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

  Future<void> createWorker(WorkerModel worker) async => await _workerRepository.create(worker);

  Future<void> linkWorker(WorkerModel worker, String companyId, WorkerRole role, {Transaction? txn}) async {
    final updatedWorker = worker.copyWith(companyId: companyId, role: role);

    await _workerRepository.link(companyId, updatedWorker, txn: txn);
    await updateWorker(updatedWorker, txn: txn);
  }

  Future<void> unlinkWorker(String workerId, {Transaction? txn}) async {
    await _workerRepository.unlink(session.companyId, workerId, txn: txn);

    final changes = {'companyId': '', 'role': workerRoleToString(WorkerRole.undefined)};

    await _workerRepository.updatePartial(workerId, changes, txn: txn);
  }

  Future<void> updateWorker(WorkerModel worker, {Transaction? txn}) async =>
      await _workerRepository.update(worker, txn: txn);
}

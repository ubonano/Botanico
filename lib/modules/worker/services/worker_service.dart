import 'dart:async';
import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WorkerService extends GetxService with ContextService {
  final WorkerRepository _workerRepository = Get.find();

  Future<List<LinkedWorkerModel>> getAllLinkedWorkers() async {
    if (!session.workerIsLoaded) await session.fetchWorker();
    return await _workerRepository.getAllLinkedWorkers(session.companyId);
  }

  Future<WorkerModel?> getWorker(String id) async => await _workerRepository.get(id);

  Future<void> createWorker(WorkerModel worker) async => await _workerRepository.create(worker);

  Future<void> linkWorker(WorkerModel worker, String companyId, WorkerRole role, {Transaction? txn}) async {
    await _addLinkedWorker(worker, companyId, role, txn: txn);

    final updatedWorker = worker.copyWith(companyId: companyId, role: role);
    await updateWorker(updatedWorker, txn: txn);
  }

  Future<void> _addLinkedWorker(WorkerModel worker, String companyId, WorkerRole role, {Transaction? txn}) async {
    final linkedWorker = LinkedWorkerModel.fromWorkerModel(worker, role);
    await _workerRepository.link(companyId, linkedWorker, txn: txn);
  }

  Future<void> updateWorker(WorkerModel worker, {Transaction? txn}) async =>
      await _workerRepository.update(worker, txn: txn);

  Future<void> unlinkWorker(String workerId, {Transaction? txn}) async {
    await _workerRepository.unlink(session.companyId, workerId, txn: txn);
    await _cleanWorkerCompanyIdAndRole(workerId, txn: txn);
  }

  Future<void> _cleanWorkerCompanyIdAndRole(String workerId, {Transaction? txn}) async {
    final worker = await getWorker(workerId);
    if (worker == null) throw CustomException(message: 'Worker not found');
    await updateWorker(worker.copyWith(companyId: '', role: WorkerRole.undefined), txn: txn);
  }
}

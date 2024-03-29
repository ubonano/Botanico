import 'dart:async';
import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WorkerService extends GetxService with LifeCycleLogService, ContextService {
  @override
  String get logTag => 'WorkerService';

  final WorkerRepository _workerRepository = Get.find();
  late final LinkedWorkerRepository _linkedWorkerRepository = Get.find();

  final linkedWorkerList$ = RxList<LinkedWorkerModel>();

  void cleanLinkedWorkerList() => linkedWorkerList$.clear();

  void removeFromLocalLinkedWorker(LinkedWorkerModel linkedWorker) =>
      linkedWorkerList$.removeWhere((lw) => lw.uid == linkedWorker.uid);

  Future<void> fetchAllLinkedWorkers() async {
    final workers = await _linkedWorkerRepository.getAll(session.companyId);

    linkedWorkerList$.assignAll(workers);
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
    await _linkedWorkerRepository.create(companyId, linkedWorker, txn: txn);
  }

  Future<void> updateWorker(WorkerModel worker, {Transaction? txn}) async =>
      await _workerRepository.update(worker, txn: txn);

  Future<void> cleanWorkerCompanyIdAndRole(String workerId, {Transaction? txn}) async {
    final worker = await getWorker(workerId);
    if (worker == null) throw CustomException(message: 'Worker not found');
    await _workerRepository.update(worker.copyWith(companyId: '', role: WorkerRole.undefined), txn: txn);
  }

  Future<void> deleteLinkedWorker(String companyId, String workerId, {Transaction? txn}) async =>
      await _linkedWorkerRepository.delete(companyId, workerId, txn: txn);

  Future<bool> isWorkerAlreadyLinked(String companyId, String workerId) async =>
      (await _linkedWorkerRepository.get(companyId, workerId)) != null;
}

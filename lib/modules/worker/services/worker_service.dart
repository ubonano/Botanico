import 'dart:async';
import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WorkerService extends GetxService with LifeCycleLogService, ContextService {
  @override
  String get logTag => 'WorkerService';

  final WorkerRepository _workerRepository = Get.find();
  final LinkedWorkerService _linkedWorkerService = Get.find();

  Future<WorkerModel?> get(String id) async => await _workerRepository.get(id);

  Future<void> create(WorkerModel worker) async => await _workerRepository.create(worker);

  Future<void> updateWorkerCompanyAndRole(WorkerModel worker, String companyId, WorkerRole role,
      {Transaction? txn}) async {
    final updatedWorker = worker.copyWith(companyId: companyId, role: role);
    await _workerRepository.update(updatedWorker, txn: txn);
    await _linkedWorkerService.linkWorkerToCompany(worker, companyId, role: role, txn: txn);
  }

  Future<void> update(WorkerModel worker, {Transaction? txn}) async => await _workerRepository.update(worker, txn: txn);

  Future<void> cleanWorkerCompanyIdAndRole(String workerId, {Transaction? txn}) async {
    final worker = await get(workerId);
    if (worker == null) throw CustomException(message: 'Worker not found');
    await _workerRepository.update(worker.copyWith(companyId: '', role: WorkerRole.undefined), txn: txn);
  }
}

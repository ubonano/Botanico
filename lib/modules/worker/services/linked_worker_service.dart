import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../module.dart';

class LinkedWorkerService extends GetxService with LifeCycleLogService {
  @override
  String get logTag => 'LinkedWorkerService';

  late final LinkedWorkerRepository _linkedWorkerRepository = Get.find();

  final list$ = RxList<LinkedWorkerModel>();

  void clean() => list$.clear();

  void removeFromLocal(LinkedWorkerModel linkedWorker) => list$.removeWhere((lw) => lw.uid == linkedWorker.uid);

  Future<void> fetchAll(String companyId) async {
    final workers = await _linkedWorkerRepository.getAll(companyId);

    list$.assignAll(workers);
  }

  Future<bool> isWorkerAlreadyLinked(String companyId, String workerId) async =>
      (await _linkedWorkerRepository.get(companyId, workerId)) != null;

  Future<void> linkWorkerToCompany(
    WorkerModel worker,
    String companyId, {
    WorkerRole role = WorkerRole.undefined,
    Transaction? txn,
  }) async {
    final linkedWorker = LinkedWorkerModel.fromWorkerModel(worker, role);
    await _linkedWorkerRepository.create(companyId, linkedWorker, txn: txn);
  }

  Future<void> delete(String companyId, String workerId, {Transaction? txn}) async {
    await _linkedWorkerRepository.delete(companyId, workerId, txn: txn);
  }
}

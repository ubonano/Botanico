import 'package:botanico/models/linked_worker_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../services/custom_controller.dart';
import '../../services/linked_worker_service.dart';

class LinkedWorkersController extends GetxController with CustomController {
  @override
  String get logTag => 'LinkedWorkersController';

  late final linkedWorkerService = Get.find<LinkedWorkerService>();

  RxList<LinkedWorkerModel> get linkedWorkers$ => linkedWorkerService.linkedWorkers$;

  void navigateToLinkWorker() => navigate.toLinkWorker(canPop: true);
  void navigateToBack() => navigate.back();

  Future<void> unlinkWorker(LinkedWorkerModel linkedWorker) async {
    if (!validateLinkedWorker(linkedWorker)) return;

    await async.perform(
      operationName: 'Unlik worker',
      successMessage: 'Trabajador desvinculado',
      inTransaction: true,
      operation: (txn) async {
        await _deleteLinkWorker(linkedWorker, txn);

        await _cleanCompanyIdFromWorkerUnliked(linkedWorker, txn);
      },
      onSuccess: () => _removeLinkedWorkerFromLocal(linkedWorker),
    );
  }

  bool validateLinkedWorker(LinkedWorkerModel linkedWorker) {
    if (linkedWorker.uid == loggedInWorkerId) {
      Get.snackbar('Error', 'No es posible auto-desvincularse');
      return false;
    }
    if (linkedWorker.isOwner) {
      Get.snackbar('Error', 'No es posible desvincular a un propietario');
      return false;
    }

    return true;
  }

  Future<void> _deleteLinkWorker(LinkedWorkerModel linkedWorkerToDelete, txn) async =>
      await linkedWorkerService.delete(loggedInCompanyId, linkedWorkerToDelete.uid, txn: txn);

  Future<void> _cleanCompanyIdFromWorkerUnliked(LinkedWorkerModel linkedWorker, Transaction? txn) async {
    final worker = await workerService.get(linkedWorker.uid);

    await workerService.update(worker!.copyWith(companyId: ''), txn: txn);
  }

  void _removeLinkedWorkerFromLocal(LinkedWorkerModel linkedWorker) =>
      linkedWorkerService.removeLinkedWorkerFromLocal(linkedWorker);

  @override
  Future<void> onInit() async {
    await super.onInit();

    await fetchLinkedWorkers();
  }

  Future<void> fetchLinkedWorkers() async => await linkedWorkerService.fetchAll(loggedInCompanyId);

  @override
  void onClose() {
    cleanLinkedWorkers();

    super.onClose();
  }

  void cleanLinkedWorkers() => linkedWorkerService.clean();
}

import 'package:botanico/models/linked_worker_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';
import '../../services/linked_worker_service.dart';

class LinkedWorkersController extends GetxController with CustomController {
  @override
  String get logTag => 'LinkedWorkersController';

  late final linkedWorkerService = Get.find<LinkedWorkerService>();
  RxList<LinkedWorkerModel> get list$ => linkedWorkerService.list$;

  Future<void> unlinkWorker(LinkedWorkerModel linkedWorker) async {
    if (!canUnlink(linkedWorker)) return;

    await async.perform(
      operationName: 'Unlink worker',
      successMessage: 'Trabajador desvinculado',
      inTransaction: true,
      operation: (txn) async => await _handleSuccessOperation(linkedWorker, txn),
      onSuccess: () => linkedWorkerService.removeFromLocal(linkedWorker),
    );
  }

  bool canUnlink(LinkedWorkerModel linkedWorker) {
    if (linkedWorker.uid == currentWorkerId) {
      snackbar.error('No es posible desvincularse a si mismo');
      return false;
    }
    
    if (linkedWorker.isOwner) {
      snackbar.error('No es posible desvincular a un propietario');
      return false;
    }

    return true;
  }

  Future<void> _handleSuccessOperation(LinkedWorkerModel linkedWorker, txn) async {
    await linkedWorkerService.delete(currentCompanyId, linkedWorker.uid, txn: txn);
    await _cleanCompanyId(linkedWorker, txn);
  }

  Future<void> _cleanCompanyId(LinkedWorkerModel linkedWorker, Transaction? txn) async {
    final worker = await workerService.get(linkedWorker.uid);
    await workerService.update(worker!.copyWith(companyId: ''), txn: txn);
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    linkedWorkerService.fetchAll(currentCompanyId);
  }

  @override
  void onClose() {
    linkedWorkerService.clean();

    super.onClose();
  }

  void navigateToLinkWorker() => navigate.toLinkWorker(canPop: true);
  void navigateBack() => navigate.back();
}

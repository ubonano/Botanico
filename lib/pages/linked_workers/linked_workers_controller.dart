import 'package:botanico/models/linked_worker_model.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';
import '../../services/linked_worker_service.dart';

class LinkedWorkersController extends GetxController with CustomController {
  @override
  String get logTag => 'LinkedWorkersController';

  late final LinkedWorkerService _linkedWorkerService = Get.find();

  RxList<LinkedWorkerModel> get list$ => _linkedWorkerService.list$;

  @override
  Future<void> onInit() async {
    await super.onInit();

    _linkedWorkerService.fetchAll(currentCompanyId);
  }

  Future<void> unlinkWorker(LinkedWorkerModel linkedWorker) async {
    if (_canUnlink(linkedWorker)) {
      await async.perform(
        operationName: 'Unlink worker',
        successMessage: 'Trabajador desvinculado',
        inTransaction: true,
        operation: (txn) async {
          await _linkedWorkerService.delete(currentCompanyId, linkedWorker.uid, txn: txn);
          await workerService.cleanWorkersCompanyId(linkedWorker.uid, txn: txn);
        },
        onSuccess: () => _linkedWorkerService.removeFromLocal(linkedWorker),
      );
    }
  }

  bool _canUnlink(LinkedWorkerModel linkedWorker) {
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

  @override
  void onClose() {
    _linkedWorkerService.clean();

    super.onClose();
  }
}

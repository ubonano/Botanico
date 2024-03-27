import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';




// Refactor
class LinkedWorkersController extends GetxController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'LinkedWorkersController';

  late final WorkerService _workerService = Get.find();
  late final LinkedWorkerService _linkedWorkerService = Get.find();

  RxList<LinkedWorkerModel> get list$ => _linkedWorkerService.list$;

  @override
  Future<void> onInit() async {
    await super.onInit();

    // Que no se pueda cambiar permisos a si mismo el usuario...

    _linkedWorkerService.fetchAll(session.companyId);
  }

  Future<void> unlinkWorker(LinkedWorkerModel linkedWorker) async {
    if (_canUnlink(linkedWorker)) {
      await operationManager.perform(
        operationName: 'Unlink worker',
        permissionKey: WorkerPermissions.unlinkKey,
        successMessage: 'Trabajador desvinculado',
        inTransaction: true,
        operation: (txn) async {
          //Refactor
          await _linkedWorkerService.delete(session.companyId, linkedWorker.uid, txn: txn);
          await _workerService.cleanWorkerCompanyIdAndRole(linkedWorker.uid, txn: txn);
        },
        onSuccess: () => _linkedWorkerService.removeFromLocal(linkedWorker),
      );
    }
  }

  bool _canUnlink(LinkedWorkerModel linkedWorker) {
    if (linkedWorker.uid == session.worker!.uid) {
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

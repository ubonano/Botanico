import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerUnlinkingController extends GetxController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'WorkerUnlinkingController';

  late final WorkerService _workerService = Get.find();

  Future<void> unlinkWorker(LinkedWorkerModel linkedWorker) async {
    if (_canUnlink(linkedWorker)) {
      await operationManager.perform(
        operationName: 'Unlink worker',
        permissionKey: WorkerPermissions.unlinkKey,
        successMessage: 'Trabajador desvinculado',
        inTransaction: true,
        operation: (txn) async {
          //Refactor
          await _workerService.deleteLinkedWorker(session.companyId, linkedWorker.uid, txn: txn);
          await _workerService.cleanWorkerCompanyIdAndRole(linkedWorker.uid, txn: txn);
        },
        onSuccess: () => _workerService.removeFromLocalLinkedWorker(linkedWorker),
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
}

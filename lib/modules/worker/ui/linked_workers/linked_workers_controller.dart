import 'package:botanico/modules/worker/models/linked_worker_model.dart';
import 'package:botanico/auxiliaries/life_cycle_log.dart';
import 'package:botanico/auxiliaries/services/snackbar_service.dart';
import 'package:botanico/modules/worker/worker_permission.dart';
import 'package:get/get.dart';
import '../../../authentication/services/session_service.dart';
import '../../services/linked_worker_service.dart';
import '../../services/worker_service.dart';
import '../../../../auxiliaries/services/async_operation_service.dart';

class LinkedWorkersController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'LinkedWorkersController';

  late final AsyncOperationService _async = Get.find();
  late final SnackbarService _snackbar = Get.find();
  late final SessionService _session = Get.find();
  late final WorkerService _workerService = Get.find();
  late final LinkedWorkerService _linkedWorkerService = Get.find();

  RxList<LinkedWorkerModel> get list$ => _linkedWorkerService.list$;

  @override
  Future<void> onInit() async {
    await super.onInit();

    // Mover la lista del servicio a este controlador, envolver en async.Perform incluyendo el permissionKey
    // Que no se pueda cambiar permisos a si mismo el usuario... 

    _linkedWorkerService.fetchAll(_session.companyId);
  }

  Future<void> unlinkWorker(LinkedWorkerModel linkedWorker) async {
    if (_canUnlink(linkedWorker)) {
      await _async.perform(
        operationName: 'Unlink worker',
        permissionKey: WorkerPermissions.unlinkKey,
        successMessage: 'Trabajador desvinculado',
        inTransaction: true,
        operation: (txn) async {
          await _linkedWorkerService.delete(_session.companyId, linkedWorker.uid, txn: txn);
          await _workerService.cleanWorkerCompanyIdAndRole(linkedWorker.uid, txn: txn);
        },
        onSuccess: () => _linkedWorkerService.removeFromLocal(linkedWorker),
      );
    }
  }

  bool _canUnlink(LinkedWorkerModel linkedWorker) {
    if (linkedWorker.uid == _session.worker!.uid) {
      _snackbar.error('No es posible desvincularse a si mismo');
      return false;
    }

    if (linkedWorker.isOwner) {
      _snackbar.error('No es posible desvincular a un propietario');
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

import 'package:botanico/models/linked_worker_model.dart';
import 'package:botanico/utils/life_cycle_log_controller.dart';
import 'package:botanico/utils/snackbar_service.dart';
import 'package:get/get.dart';
import '../../controllers/session_controller.dart';
import '../../services/linked_worker_service.dart';
import '../../services/worker_service.dart';
import '../../utils/async_operation_service.dart';

class LinkedWorkersController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'LinkedWorkersController';

  late final AsyncOperationService _async = Get.find();
  late final SnackbarService _snackbar = Get.find();
  late final SessionController _session = Get.find();
  late final WorkerService _workerService = Get.find();
  late final LinkedWorkerService _linkedWorkerService = Get.find();

  RxList<LinkedWorkerModel> get list$ => _linkedWorkerService.list$;

  get hasPermissionToLinkWorker => _session.companyIsLoaded && _session.worker!.hasPermissionToLinkWorker();
  get hasPermissionToUnlinkWorker => _session.companyIsLoaded && _session.worker!.hasPermissionToUnlinkWorker();

  @override
  Future<void> onInit() async {
    await super.onInit();

    _linkedWorkerService.fetchAll(_session.companyId);
  }

  Future<void> unlinkWorker(LinkedWorkerModel linkedWorker) async {
    if (_canUnlink(linkedWorker)) {
      await _async.perform(
        operationName: 'Unlink worker',
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
    if (!_session.worker!.hasPermissionToUnlinkWorker()) {
      _snackbar.error('Usted no tiene permiso para desvincular un trabajador');
      return false;
    }

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

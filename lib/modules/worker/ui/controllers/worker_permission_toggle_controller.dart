import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerPermissionToggleController extends GetxController with LifeCycleLoggingControllerHelper, GlobalHelper {
  @override
  String get logTag => 'PermissionToggleController';

  late final WorkerService _workerService = Get.find();

  WorkerModel? get curWorkerForUpdate => _workerService.curWorkerForUpdate$;

  @override
  Future<void> onInit() async {
    super.onInit();

    await _workerService.fetchCurWorkerForUpdate();
  }

  Future<void> togglePermission(String permissionId) async =>
      await _workerService.togglePermissionCurWorkerForUpdate(permissionId);
}

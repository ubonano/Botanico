import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class WorkerPermissionToggleController extends GetxController with LifeCycleLoggingControllerHelper, GlobalHelper {
  @override
  String get logTag => 'PermissionToggleController';

  late final IWorkerService _workerService = Get.find();

  WorkerModel? get curWorkerForUpdate => _workerService.curWorkerForUpdate$;

  @override
  Future<void> onInit() async {
    super.onInit();

    await _workerService.fetchCurWorkerForUpdate();
  }

  Future<void> togglePermission(String permissionId) async =>
      await _workerService.togglePermissionCurWorkerForUpdate(permissionId);
}

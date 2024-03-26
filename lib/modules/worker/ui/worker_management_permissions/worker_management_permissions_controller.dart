import 'package:botanico/auxiliaries/services/async_operation_service.dart';
import 'package:get/get.dart';

import '../../../../auxiliaries/module.dart';
import '../../models/worker_model.dart';
import '../../../../auxiliaries/services/permission_module_service.dart';
import '../../services/worker_service.dart';
import '../../../../auxiliaries/life_cycle_log.dart';

class WorkerManagementPermissionsController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'WorkerManagementPermissionsController';

  late final AsyncOperationService _async = Get.find();
  late final PermissionModuleService _moduleService = Get.find();
  late final WorkerService _workerService = Get.find();

  final Rxn<WorkerModel> worker$ = Rxn<WorkerModel>();
  final RxList<Module> modules$ = <Module>[].obs;

  String get _workerIdParm => Get.arguments;
  WorkerModel? get worker => worker$.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    modules$.addAll(
      _moduleService.getAll(),
    );

    await _fetchWorker();
  }

  Future<void> _fetchWorker() async {
    await _async.perform(
      operationName: 'Get worker $_workerIdParm',
      operation: (_) async => worker$.value = await _workerService.get(_workerIdParm),
    );
  }

  Future<void> togglePermission(String permissionId) async {
    if (worker != null) {
      final updatedPermissions = _togglePermissionInMap(worker!.permissions, permissionId);
      final modifiedWorker = worker!.copyWith(permissions: updatedPermissions);

      await _async.perform(
        operationName: 'Toggle permission $permissionId',
        operation: (_) async => await _workerService.update(modifiedWorker),
        onSuccess: () => worker$.value = modifiedWorker,
      );
    }
  }

  Map<String, bool> _togglePermissionInMap(Map<String, bool> permissions, String permissionId) {
    if (permissions.containsKey(permissionId) && permissions[permissionId] == true) {
      permissions.remove(permissionId);
    } else {
      permissions[permissionId] = true;
    }
    return permissions;
  }
}

import 'package:botanico/services/async_operation_service.dart';
import 'package:get/get.dart';

import '../../models/module_model.dart';
import '../../models/worker_model.dart';
import '../../services/module_service.dart';
import '../../services/worker_service.dart';
import '../../utils/life_cycle_log_controller.dart';

class PermissionsController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'PermissionsController';

  late final AsyncOperationService _async = Get.find();
  late final ModuleService _moduleService = Get.find();
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
    return Map.from(permissions)..update(permissionId, (value) => !value, ifAbsent: () => true);
  }
}

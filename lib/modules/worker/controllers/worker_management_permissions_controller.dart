import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerManagementPermissionsController extends GetxController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'WorkerManagementPermissionsController';

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

  //Refactor

  Future<void> _fetchWorker() async {
    await operationManager.perform(
      operationName: 'Get worker $_workerIdParm',
      operation: (_) async => worker$.value = await _workerService.getWorker(_workerIdParm),
    );
  }

  Future<void> togglePermission(String permissionId) async {
    if (worker != null) {
      final updatedPermissions = _togglePermissionInMap(worker!.permissions, permissionId);
      final modifiedWorker = worker!.copyWith(permissions: updatedPermissions);

      await operationManager.perform(
        operationName: 'Toggle permission $permissionId',
        permissionKey: WorkerPermissions.managePermissionsKey,
        operation: (_) async => await _workerService.updateWorker(modifiedWorker),
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

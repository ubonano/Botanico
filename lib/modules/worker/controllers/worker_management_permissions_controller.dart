import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerManagementPermissionsController extends GetxController with ContextController {
  @override
  String get logTag => 'WorkerManagementPermissionsController';

  late final PermissionModuleService _moduleService = Get.find();
  late final WorkerService _workerService = Get.find();

  final Rxn<WorkerModel> worker$ = Rxn<WorkerModel>();
  final RxList<Module> modules$ = <Module>[].obs;

  dynamic get _workerIdParm => Get.arguments;
  WorkerModel? get worker => worker$.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    modules$.addAll(_moduleService.getAll());

    await fetchWorker();
  }

  Future<void> fetchWorker() async {
    await operationManager.perform(
      operationName: 'Get worker $_workerIdParm',
      permissionKey: WorkerPermissions.viewKey,
      operation: (_) async => worker$.value = await _workerService.getWorker(_workerIdParm),
      onError: (error) => navigate.toHome(),
    );
  }

  Future<void> togglePermission(String permissionId) async {
    await operationManager.perform(
      operationName: 'Toggle permission $permissionId',
      permissionKey: WorkerPermissions.managePermissionsKey,
      operation: (_) async => await _workerService.togglePermission(worker!, permissionId),
      onSuccess: () => fetchWorker(),
    );
  }
}

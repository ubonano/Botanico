import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerManagementPermissionsController extends GetxController with ContextController {
  @override
  String get logTag => 'WorkerManagementPermissionsController';

  late final PermissionModuleService _moduleService = Get.find();
  late final WorkerRepository _workerRepository = Get.find();

  final Rxn<WorkerModel> worker$ = Rxn<WorkerModel>();
  final RxList<ModuleModel> modules$ = <ModuleModel>[].obs;

  dynamic get _workerIdParm => Get.arguments;
  WorkerModel? get worker => worker$.value;

  // TODO Refactor, extraer la logica del toggle en un controller independiente

  @override
  Future<void> onInit() async {
    super.onInit();
    modules$.addAll(_moduleService.getAll());

    await _fetchWorker();
  }

  Future<void> togglePermission(String permissionId) async {
    await _togglePermission(
      worker: worker!,
      permissionId: permissionId,
    );
  }

  Future<void> _togglePermission({
    required WorkerModel worker,
    required String permissionId,
  }) async {
    await oprManager.perform(
      operationName: 'Toggle permission $permissionId',
      permissionKey: WorkerModulePermissions.managePermissionsKey,
      operation: (_) async {
        worker.togglePermission(permissionId);
        await _workerRepository.updateWorker(worker);
      },
      onSuccess: _fetchWorker,
    );
  }

  Future<void> _fetchWorker() async => worker$.value = await _workerRepository.get(_workerIdParm);
}

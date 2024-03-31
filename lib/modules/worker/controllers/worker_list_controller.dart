import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerListController extends GetxController with ContextController {
  @override
  String get logTag => 'WorkerListController';

  late final WorkerService _workerService = Get.find();
  final workerList$ = RxList<WorkerModel>();

  @override
  void onInit() {
    super.onInit();

    fetchAllWorkers();
  }

  Future<void> fetchAllWorkers() async {
    await operationManager.perform(
      operationName: 'Fetch workers',
      permissionKey: WorkerPermissions.viewKey,
      operation: (_) async => workerList$.value = await _workerService.getAllLinkedWorkers(),
    );
  }

  void removeWorker(WorkerModel worker) => workerList$.removeWhere((lw) => lw.uid == worker.uid);

  @override
  void onClose() {
    workerList$.clear();

    super.onClose();
  }
}

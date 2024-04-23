import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

void workerDependencies() {
  Get.lazyPut<WorkerRepository>(() => WorkerRepository(), fenix: true);

  Get.lazyPut<WorkerLobbyController>(() => WorkerLobbyController(), fenix: true);

  Get.lazyPut<WorkerCreateController>(() => WorkerCreateController(), fenix: true);
  Get.lazyPut<WorkerListController>(() => WorkerListController(), fenix: true);
  Get.lazyPut<WorkerLinkingController>(() => WorkerLinkingController(), fenix: true);
  Get.lazyPut<WorkerLinkingController>(() => WorkerLinkingController(), fenix: true);
  Get.lazyPut<WorkerUnlinkingController>(() => WorkerUnlinkingController(), fenix: true);
  Get.lazyPut<WorkerManagementPermissionsController>(() => WorkerManagementPermissionsController(), fenix: true);
}

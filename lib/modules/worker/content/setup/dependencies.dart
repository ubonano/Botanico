import 'package:get/get.dart';

import '../../worker_business_logic.dart';
import '../../worker_service.dart';
import '../model/linked_worker_repository.dart';
import '../../worker_repository.dart';
import '../../ui/ui.dart';
import 'interfaces/i_linked_worker_repository.dart';
import 'interfaces/i_worker_business_logic.dart';
import 'interfaces/i_worker_repository.dart';
import 'interfaces/i_worker_service.dart';
import 'permissions.dart';

void setupDependencies() {
  Get.lazyPut<WorkerPermissions>(() => WorkerPermissions(), fenix: true);

  Get.lazyPut<IWorkerBusinessLogic>(() => WorkerBusinessLogic(), fenix: true);
  Get.lazyPut<IWorkerRepository>(() => WorkerRepository(), fenix: true);
  Get.lazyPut<ILinkedWorkerRepository>(() => LinkedWorkerRepository(), fenix: true);
  Get.lazyPut<IWorkerService>(() => WorkerService(), fenix: true);

  Get.lazyPut<WorkerPermissionManagementController>(() => WorkerPermissionManagementController(), fenix: true);
  Get.lazyPut<WorkerLobbyController>(() => WorkerLobbyController(), fenix: true);
  Get.lazyPut<WorkerFormController>(() => WorkerFormController(), fenix: true);
  Get.lazyPut<WorkerListController>(() => WorkerListController(), fenix: true);
  Get.lazyPut<WorkerLinkController>(() => WorkerLinkController(), fenix: true);
  Get.lazyPut<WorkerLinkController>(() => WorkerLinkController(), fenix: true);
  Get.lazyPut<WorkerPermissionToggleController>(() => WorkerPermissionToggleController(), fenix: true);
}

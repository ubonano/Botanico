import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

export 'core/controllers/worker_linking_controller.dart';
export 'core/controllers/worker_list_controller.dart';
export 'core/controllers/worker_unlinking_controller.dart';
export 'core/controllers/worker_lobby_controller.dart';
export 'core/controllers/worker_create_controller.dart';
export 'core/controllers/worker_management_permissions_controller.dart';

export 'core/exceptions/worker_not_found_exception.dart';

export 'core/models/enums/worker_role.dart';
export 'core/models/worker_model.dart';

export 'core/repositories/worker_repository.dart';

export 'tests/flows/worker_create_from_sign_up_flow.dart';

export 'tests/worker_create/worker_create_empty_fields_test.dart';
export 'tests/worker_create/worker_create_invalid_birthdate_format_test.dart';
export 'tests/worker_create/worker_create_invalid_phone_format_test.dart';
export 'tests/worker_create/worker_create_invalid_dni_format_test.dart';
export 'tests/worker_create/worker_create_success_from_sign_up_test.dart';
export 'tests/worker_create/worker_create_success_from_sign_in_test.dart';

export 'core/ui/worker_linking_page.dart';
export 'core/ui/worker_list_page.dart';
export 'core/ui/worker_create_page.dart';
export 'core/ui/worker_management_permissions_page.dart';
export 'core/ui/worker_lobby_page.dart';
export 'core/ui/widgets/worker_list.dart';
export 'core/ui/widgets/worker_linking_fab.dart';
export 'core/ui/widgets/save_worker_button.dart';

export 'core/worker_context.dart';

export 'worker_module_permission.dart';

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

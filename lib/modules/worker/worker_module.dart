import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

export 'ui/controllers/worker_link_controller.dart';
export 'ui/controllers/worker_list_controller.dart';
export 'ui/controllers/worker_unlinking_controller.dart';
export 'ui/controllers/worker_lobby_controller.dart';
export 'ui/controllers/worker_create_controller.dart';
export 'ui/controllers/worker_permission_toggle_controller.dart';

export 'core/helpers/exceptions/worker_not_found_exception.dart';
export 'core/business_logic/worker_business_logic.dart';

export 'core/helpers/interfaces/i_worker_business_logic.dart';
export 'core/helpers/interfaces/i_worker_repository.dart';
export 'core/helpers/interfaces/i_worker_service.dart';

export 'core/models/enums/worker_role.dart';
export 'core/models/worker_model.dart';

export 'core/repositories/worker_repository.dart';
export 'core/services/worker_service.dart';

export 'tests/flows/worker_create_from_sign_up_flow.dart';

export 'tests/worker_create/worker_create_empty_fields_test.dart';
export 'tests/worker_create/worker_create_invalid_birthdate_format_test.dart';
export 'tests/worker_create/worker_create_invalid_phone_format_test.dart';
export 'tests/worker_create/worker_create_invalid_dni_format_test.dart';
export 'tests/worker_create/worker_create_success_from_sign_up_test.dart';
export 'tests/worker_create/worker_create_success_from_sign_in_test.dart';

export 'ui/worker_link_page.dart';
export 'ui/worker_list_page.dart';
export 'ui/worker_create_page.dart';

export 'ui/worker_lobby_page.dart';
export 'ui/widgets/fields/birthdate_input_field.dart';
export 'ui/widgets/fields/dni_input_field.dart';
export 'ui/widgets/fields/fullname_input_field.dart';
export 'ui/widgets/fields/worker_uid_input_field.dart';
export 'ui/widgets/worker_list.dart';
export 'ui/widgets/buttons/worker_link_fab.dart';
export 'ui/widgets/buttons/worker_save_button.dart';
export 'ui/widgets/buttons/worker_copy_uid_button.dart';
export 'ui/widgets/buttons/worker_paste_uid_button.dart';
export 'ui/widgets/buttons/worker_link_button.dart';
export 'ui/widgets/buttons/worker_scan_qr_button.dart';
export 'ui/widgets/buttons/worker_navigate_to_module_list_icon_button.dart';
export 'ui/widgets/buttons/worker_unlink_icon_button.dart';
export 'ui/widgets/buttons/worker_list_tile_trailing_icon_buttons.dart';
export 'ui/widgets/worker_uid_qr_code.dart';
export 'ui/widgets/worker_permission_toggle.dart';

export 'worker_module_permission.dart';

void workerDependencies() {
  Get.lazyPut<IWorkerRepository>(() => WorkerRepository(), fenix: true);
  Get.lazyPut<IWorkerBusinessLogic>(() => WorkerBusinessLogic(), fenix: true);
  Get.lazyPut<IWorkerService>(() => WorkerService(), fenix: true);

  Get.lazyPut<WorkerLobbyController>(() => WorkerLobbyController(), fenix: true);
  Get.lazyPut<WorkerCreateController>(() => WorkerCreateController(), fenix: true);
  Get.lazyPut<WorkerListController>(() => WorkerListController(), fenix: true);
  Get.lazyPut<WorkerLinkController>(() => WorkerLinkController(), fenix: true);
  Get.lazyPut<WorkerLinkController>(() => WorkerLinkController(), fenix: true);
  Get.lazyPut<WorkerUnlinkingController>(() => WorkerUnlinkingController(), fenix: true);
}

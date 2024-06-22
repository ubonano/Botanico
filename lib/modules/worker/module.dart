import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

export 'ui/worker_link_page/worker_link_controller.dart';
export 'ui/worker_list_page/worker_list_controller.dart';
export 'ui/worker_lobby_page/worker_lobby_controller.dart';
export 'ui/worker_form_page/worker_form_controller.dart';
export 'ui/worker_permission_toggle/worker_permission_toggle_controller.dart';

export 'core/worker_business_logic.dart';

export 'core/exceptions/worker_not_found_exception.dart';
export 'navigation_helper.dart';

export 'core/interfaces/i_worker_business_logic.dart';
export 'core/interfaces/i_worker_repository.dart';
export 'core/interfaces/i_linked_worker_repository.dart';
export 'core/interfaces/i_worker_service.dart';

export 'core/model/enums/worker_role.dart';
export 'core/model/worker_model.dart';

export 'core/model/worker_repository.dart';
export 'core/model/linked_worker_repository.dart';
export 'core/worker_service.dart';

export 'tests/flows/worker_create_from_sign_up_flow.dart';

export 'tests/worker_create/worker_create_empty_fields_test.dart';
export 'tests/worker_create/worker_create_invalid_birthdate_format_test.dart';
export 'tests/worker_create/worker_create_invalid_phone_format_test.dart';
export 'tests/worker_create/worker_create_invalid_dni_format_test.dart';
export 'tests/worker_create/worker_create_success_from_sign_up_test.dart';
export 'tests/worker_create/worker_create_success_from_sign_in_test.dart';

export 'ui/worker_link_page/worker_link_page.dart';
export 'ui/worker_list_page/worker_list_page.dart';
export 'ui/worker_form_page/worker_form_page.dart';

export 'ui/worker_lobby_page/worker_lobby_page.dart';
export 'ui/worker_form_page/widgets/fields/birthdate_input_field.dart';
export 'ui/worker_form_page/widgets/fields/dni_input_field.dart';
export 'ui/worker_form_page/widgets/fields/fullname_input_field.dart';
export 'ui/worker_form_page/widgets/fields/worker_uid_input_field.dart';
export 'ui/worker_list_page/widgets/worker_list.dart';

export 'ui/worker_list_page/widgets/worker_list_page_tile_button.dart';
export 'ui/worker_list_page/widgets/worker_link_fab.dart';
export 'ui/worker_form_page/widgets/worker_save_button.dart';
export 'ui/worker_lobby_page/widgets/worker_copy_uid_button.dart';
export 'ui/worker_link_page/widgets/worker_paste_uid_button.dart';
export 'ui/worker_list_page/widgets/worker_link_button.dart';
export 'ui/worker_lobby_page/widgets/worker_scan_qr_button.dart';
export 'ui/worker_list_page/widgets/worker_navigate_to_module_list_icon_button.dart';
export 'ui/worker_list_page/widgets/worker_unlink_icon_button.dart';
export 'ui/worker_list_page/widgets/worker_list_tile_trailing_icon_buttons.dart';

export 'ui/worker_lobby_page/widgets/worker_uid_qr_code.dart';
export 'ui/worker_permission_toggle/worker_permission_toggle.dart';

void dependencies() {
  Get.put<IWorkerBusinessLogic>(WorkerBusinessLogic(), permanent: true);

  Get.lazyPut<IWorkerRepository>(() => WorkerRepository(), fenix: true);
  Get.lazyPut<ILinkedWorkerRepository>(() => LinkedWorkerRepository(), fenix: true);
  Get.lazyPut<IWorkerService>(() => WorkerService(), fenix: true);

  Get.lazyPut<WorkerLobbyController>(() => WorkerLobbyController(), fenix: true);
  Get.lazyPut<WorkerFormController>(() => WorkerFormController(), fenix: true);
  Get.lazyPut<WorkerListController>(() => WorkerListController(), fenix: true);
  Get.lazyPut<WorkerLinkController>(() => WorkerLinkController(), fenix: true);
  Get.lazyPut<WorkerLinkController>(() => WorkerLinkController(), fenix: true);
  Get.lazyPut<WorkerPermissionToggleController>(() => WorkerPermissionToggleController(), fenix: true);
}

class WorkerModulePermissions implements ModuleStructure {
  @override
  String get moduleId => 'worker';

  @override
  String get moduleName => 'Trabajadores';

  static const viewKey = 'worker.view';
  static const linkKey = 'worker.link';
  static const unlinkKey = 'worker.unlink';
  static const managePermissionsKey = 'worker.managePermissions';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: linkKey, name: 'Vincular'),
        PermissionModel(id: unlinkKey, name: 'Desvincular'),
        PermissionModel(id: managePermissionsKey, name: 'Gestionar permisos'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(id: moduleId, name: moduleName, permissions: permissions);
}

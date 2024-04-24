import 'package:get/get.dart';

import 'core/services/log_service.dart';
import 'core/services/navigation_service.dart';
import 'core/services/operation_manager_service.dart';
import 'core/services/permission_module_service.dart';
import 'core/services/snackbar_service.dart';
import 'core/controllers/home_controller.dart';
import 'core/ui/widgets/custom_drawer/custom_drawer_controller.dart';

export 'core/services/snackbar_service.dart';
export 'core/services/permission_module_service.dart';
export 'core/services/operation_manager_service.dart';
export 'core/services/log_service.dart';

export 'core/services/navigation_service.dart';
export 'core/controllers/context_controller.dart';
export 'core/controllers/form_controller.dart';

export 'core/ui/widgets/buttons/custom_button.dart';
export 'core/ui/widgets/buttons/custom_text_button.dart';

export 'core/ui/widgets/input_fields/address_input_field.dart';
export 'core/ui/widgets/input_fields/birthdate_input_field.dart';
export 'core/ui/widgets/input_fields/city_input_field.dart';
export 'core/ui/widgets/input_fields/confirm_password_input_field.dart';
export 'core/ui/widgets/input_fields/country_input_field.dart';
export 'core/ui/widgets/input_fields/custom_input_field.dart';
export 'core/ui/widgets/input_fields/dni_input_field.dart';
export 'core/ui/widgets/input_fields/email_input_field.dart';
export 'core/ui/widgets/input_fields/fullname_input_field.dart';
export 'core/ui/widgets/input_fields/name_input_field.dart';
export 'core/ui/widgets/input_fields/password_input_field.dart';
export 'core/ui/widgets/input_fields/phone_input_field.dart';
export 'core/ui/widgets/input_fields/province_input_field.dart';
export 'core/ui/widgets/input_fields/worker_uid_input_field.dart';

export 'core/ui/widgets/custom_drawer/custom_drawer.dart';
export 'core/ui/widgets/custom_drawer/custom_drawer_controller.dart';

export 'core/ui/widgets/confirmation_dialog.dart';
export 'core/ui/widgets/custom_scaffold.dart';
export 'core/ui/widgets/permission_protected.dart';

export 'core/controllers/home_controller.dart';
export 'core/ui/home_page.dart';
export '../../app.dart';

export '../../setup/firestore_collections.dart';
export 'core/aux/validator.dart';
export 'core/aux/module_structure.dart';
export '../../setup/fields_key.dart';
export 'core/aux/utils.dart';

export 'core/models/module_model.dart';
export 'core/models/permission_model.dart';

export '../../setup/bindings.dart';
export '../../setup/firebase_options.dart';
export '../../setup/pages.dart';
export '../../setup/routes.dart';

export '../../tests/flows/app_init_flow.dart';

void foundationDependencies() {
  Get.put(NavigationService(), permanent: true);
  Get.put(LogService(), permanent: true);
  Get.put(SnackbarService(), permanent: true);
  Get.put(OperationManagerService(), permanent: true);

  Get.lazyPut<PermissionModuleService>(() => PermissionModuleService(), fenix: true);

  Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
}

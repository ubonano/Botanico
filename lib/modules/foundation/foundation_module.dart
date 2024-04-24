import 'package:get/get.dart';

import 'services/log_service.dart';
import 'services/navigation_service.dart';
import 'services/operation_manager_service.dart';
import 'services/permission_module_service.dart';
import 'services/snackbar_service.dart';
import 'ui/home/home_controller.dart';
import 'ui/widgets/custom_drawer/custom_drawer_controller.dart';

export 'services/snackbar_service.dart';
export 'services/permission_module_service.dart';
export 'services/operation_manager_service.dart';
export 'services/log_service.dart';

export 'services/navigation_service.dart';
export 'controllers/context_controller.dart';
export 'controllers/form_controller.dart';

export 'ui/widgets/buttons/custom_button.dart';
export 'ui/widgets/buttons/custom_text_button.dart';

export 'ui/widgets/input_fields/address_input_field.dart';
export 'ui/widgets/input_fields/birthdate_input_field.dart';
export 'ui/widgets/input_fields/city_input_field.dart';
export 'ui/widgets/input_fields/confirm_password_input_field.dart';
export 'ui/widgets/input_fields/country_input_field.dart';
export 'ui/widgets/input_fields/custom_input_field.dart';
export 'ui/widgets/input_fields/dni_input_field.dart';
export 'ui/widgets/input_fields/email_input_field.dart';
export 'ui/widgets/input_fields/fullname_input_field.dart';
export 'ui/widgets/input_fields/name_input_field.dart';
export 'ui/widgets/input_fields/password_input_field.dart';
export 'ui/widgets/input_fields/phone_input_field.dart';
export 'ui/widgets/input_fields/province_input_field.dart';
export 'ui/widgets/input_fields/worker_uid_input_field.dart';

export 'ui/widgets/custom_drawer/custom_drawer.dart';
export 'ui/widgets/custom_drawer/custom_drawer_controller.dart';

export 'ui/widgets/confirmation_dialog.dart';
export 'ui/widgets/custom_scaffold.dart';
export 'ui/widgets/permission_protected.dart';

export 'ui/home/home_controller.dart';
export 'ui/home/home_page.dart';
export 'ui/app.dart';

export 'aux/firestore_collections.dart';
export 'aux/validator.dart';
export 'aux/module_structure.dart';
export 'aux/fields_key.dart';
export 'aux/utils.dart';

export 'models/module_model.dart';
export 'models/permission_model.dart';

export 'config/bindings.dart';
export 'config/firebase_options.dart';
export 'config/pages.dart';
export 'config/routes.dart';

export 'tests/flows/app_init_flow.dart';

void foundationDependencies() {
  Get.put(NavigationService(), permanent: true);
  Get.put(LogService(), permanent: true);
  Get.put(SnackbarService(), permanent: true);
  Get.put(OperationManagerService(), permanent: true);

  Get.lazyPut<PermissionModuleService>(() => PermissionModuleService(), fenix: true);

  Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
}

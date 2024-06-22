import 'package:get/get.dart';

import 'ui/home_page/home_controller.dart';
import 'ui/widgets/custom_drawer/custom_drawer_controller.dart';

export 'ui/widgets/custom_drawer/custom_drawer_controller.dart';
export 'ui/home_page/home_controller.dart';

export 'core/helpers/validator_helper.dart';
export 'core/helpers/module_structure.dart';
export 'core/helpers/function_helper.dart';

export 'core/helpers/life_cycle_logging_controller_helper.dart';
export 'core/helpers/form_helper.dart';
export 'core/helpers/paginated_list_helper.dart';
export 'core/helpers/global_helper.dart';

export '../worker/core/model/module_model.dart';

import 'core/helpers/log_helper.dart';
import 'core/helpers/navigation_helper.dart';
import 'core/helpers/operation_helper.dart';
import 'core/module_repository.dart';
import 'core/helpers/snackbar_helper.dart';

export 'core/helpers/snackbar_helper.dart';
export 'core/helpers/operation_helper.dart';
export 'core/helpers/log_helper.dart';
export 'core/helpers/navigation_helper.dart';
export 'core/helpers/fields_key.dart';
export 'core/module_repository.dart';

export 'tests/flows/open_drawer_flow.dart';

export 'ui/widgets/buttons/custom_button.dart';
export 'ui/widgets/buttons/custom_text_button.dart';
export 'ui/home_page/widgets/home_page_tile_button.dart';

export 'ui/widgets/custom_input_field.dart';
export 'ui/widgets/custom_drawer/custom_drawer.dart';
export 'ui/widgets/confirmation_dialog.dart';
export 'ui/widgets/custom_scaffold.dart';
export 'ui/widgets/protected_widget.dart';
export '../company/ui/company_form_page/widgets/module_active_toggle.dart';

export 'ui/home_page/home_page.dart';

export '../../app.dart';
export '../../setup/bindings.dart';
export '../../setup/firebase_options.dart';
export '../../setup/pages.dart';
export '../../setup/routes.dart';
export '../../tests/flows/app_init_flow.dart';

void dependencies() {
  Get.put(NavigationHelper(), permanent: true);
  Get.put(LogHelper(), permanent: true);
  Get.put(SnackbarHelper(), permanent: true);
  Get.put(OperationHelper(), permanent: true);

  Get.lazyPut<ModuleRepository>(() => ModuleRepository(), fenix: true);

  Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
}

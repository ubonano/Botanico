import 'package:get/get.dart';
import 'ui/controllers/module_list_controller.dart';
import 'ui/controllers/home_controller.dart';
import 'ui/controllers/custom_drawer_controller.dart';

export 'ui/controllers/custom_drawer_controller.dart';
export 'ui/controllers/home_controller.dart';
export 'ui/controllers/module_list_controller.dart';

export 'core/helpers/validator_helper.dart';
export 'core/helpers/module_structure.dart';
export 'core/helpers/function_helper.dart';

export 'core/helpers/life_cycle_logging_controller_helper.dart';
export 'core/helpers/form_helper.dart';
export 'core/helpers/global_helper.dart';

export 'core/models/module_model.dart';
export 'core/models/permission_model.dart';

import 'core/helpers/log_helper.dart';
import 'core/helpers/navigation_helper.dart';
import 'core/helpers/operation_helper.dart';
import 'core/repositories/module_repository.dart';
import 'core/helpers/snackbar_helper.dart';

export 'core/helpers/snackbar_helper.dart';
export 'core/repositories/module_repository.dart';
export 'core/helpers/operation_helper.dart';
export 'core/helpers/log_helper.dart';
export 'core/helpers/navigation_helper.dart';

export 'ui/widgets/buttons/custom_button.dart';
export 'ui/widgets/buttons/custom_text_button.dart';
export 'ui/widgets/custom_input_field.dart';

export 'ui/widgets/module_expansion_tile.dart';
export 'ui/widgets/custom_drawer.dart';
export 'ui/widgets/confirmation_dialog.dart';
export 'ui/widgets/custom_scaffold.dart';
export 'ui/widgets/permission_protected.dart';

export 'ui/module_list_page.dart';

export 'ui/home_page.dart';

export '../../app.dart';
export '../../setup/firestore_collections.dart';
export '../../setup/fields_key.dart';
export '../../setup/bindings.dart';
export '../../setup/firebase_options.dart';
export '../../setup/pages.dart';
export '../../setup/routes.dart';
export '../../tests/flows/app_init_flow.dart';

void foundationDependencies() {
  Get.put(NavigationHelper(), permanent: true);
  Get.put(LogHelper(), permanent: true);
  Get.put(SnackbarHelper(), permanent: true);
  Get.put(OperationHelper(), permanent: true);

  Get.lazyPut<ModuleRepository>(() => ModuleRepository(), fenix: true);
  Get.lazyPut<ModuleListController>(() => ModuleListController(), fenix: true);

  Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
}

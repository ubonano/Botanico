import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import 'core/controllers/vendor_create_controller.dart';
import 'core/controllers/vendor_list_controller.dart';
import 'core/controllers/vendor_delete_controller.dart';

import 'core/controllers/vendor_update_controller.dart';
import 'core/helpers/interfaces/i_vendor_business_logic.dart';
import 'core/helpers/interfaces/i_vendor_repository.dart';
import 'core/helpers/interfaces/i_vendor_service.dart';
import 'core/vendor_business_logic.dart';
import 'core/vendor_repository.dart';
import 'core/vendor_service.dart';

export 'core/controllers/vendor_create_controller.dart';
export 'core/controllers/vendor_list_controller.dart';
export 'core/controllers/vendor_delete_controller.dart';
export 'core/controllers/vendor_update_controller.dart';

export 'core/vendor_business_logic.dart';

export 'core/helpers/interfaces/i_vendor_business_logic.dart';
export 'core/helpers/interfaces/i_vendor_repository.dart';
export 'core/helpers/interfaces/i_vendor_service.dart';

export 'core/helpers/vendor_navigation_helper.dart';

export 'core/vendor_model.dart';

export 'core/vendor_repository.dart';

export 'core/vendor_service.dart';

export 'ui/widgets/buttons/vendor_create_fab.dart';
export 'ui/widgets/buttons/vendor_list_page_tile_button.dart';
export 'ui/widgets/buttons/vendor_delete_icon_button.dart';
export 'ui/widgets/buttons/vendor_update_icon_button.dart';
export 'ui/widgets/buttons/vendor_list_tile_trailing_icon_buttons.dart';
export 'ui/widgets/vendor_save_button.dart';
export 'ui/widgets/observations_input_field.dart';
export 'ui/widgets/vendor_list.dart';

export 'ui/vendor_create_page.dart';
export 'ui/vendor_update_page.dart';
export 'ui/vendor_list_page.dart';

void dependencies() {
  Get.put<IVendorBusinessLogic>(VendorBusinessLogic(), permanent: true);

  Get.lazyPut<IVendorRepository>(() => VendorRepository(), fenix: true);
  Get.lazyPut<IVendorService>(() => VendorService(), fenix: true);

  Get.lazyPut<VendorCreateController>(() => VendorCreateController(), fenix: true);
  Get.lazyPut<VendorUpdateController>(() => VendorUpdateController(), fenix: true);
  Get.lazyPut<VendorListController>(() => VendorListController(), fenix: true);
  Get.lazyPut<VendorDeleteController>(() => VendorDeleteController(), fenix: true);
}

class VendorModulePermissions implements ModuleStructure {
  @override
  String get moduleId => 'vendor';

  @override
  String get moduleName => 'Proveedores';

  static const viewKey = 'vendor.view';
  static const createKey = 'vendor.create';
  static const updateKey = 'vendor.update';
  static const deleteKey = 'vendor.delete';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: createKey, name: 'Crear'),
        PermissionModel(id: updateKey, name: 'Actualizar'),
        PermissionModel(id: deleteKey, name: 'Eliminar'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(name: 'Proveedores', permissions: permissions);
}

import 'package:botanico/modules/foundation/module.dart';

export 'core/vendor_business_logic.dart';

export 'core/helpers/interfaces/i_vendor_business_logic.dart';
export 'core/helpers/interfaces/i_vendor_repository.dart';
export 'core/helpers/interfaces/i_vendor_service.dart';

export 'core/helpers/vendor_navigation_helper.dart';

export 'core/vendor_model.dart';

export 'core/vendor_repository.dart';

export 'core/vendor_service.dart';

void dependencies() {}

class WorkerModulePermissions implements ModuleStructure {
  @override
  String get moduleId => 'vendor';

  @override
  String get moduleName => 'Proveedores';

  // static const viewKey = 'worker.view';

  @override
  List<PermissionModel> get permissions => [
        // PermissionModel(id: viewKey, name: 'Ver'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(name: 'Proveedores', permissions: permissions);
}

import 'package:botanico/modules/foundation/module.dart';

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
  ModuleModel toModel() => ModuleModel(name: 'Trabajadores', permissions: permissions);
}

import 'package:botanico/auxiliaries/auxiliaries.dart';

class WorkerPermissions implements PermissionsModule {
  @override
  String get moduleId => 'worker';

  @override
  String get moduleName => 'Trabajadores';

  static const viewKey = 'worker.view';
  static const linkKey = 'worker.link';
  static const unlinkKey = 'worker.unlink';
  static const managePermissionsKey = 'worker.managePermissions';

  @override
  List<Permission> get permissions => [
        Permission(id: viewKey, name: 'Ver'),
        Permission(id: linkKey, name: 'Vincular'),
        Permission(id: unlinkKey, name: 'Desvincular'),
        Permission(id: managePermissionsKey, name: 'Gestionar permisos'),
      ];

  @override
  Module toModule() => Module(name: 'Trabajadores', permissions: permissions);
}

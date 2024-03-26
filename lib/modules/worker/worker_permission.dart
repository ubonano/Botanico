import 'package:botanico/auxiliaries/module.dart';
import 'package:botanico/auxiliaries/permission_module.dart';

import '../../auxiliaries/permission.dart';

class WorkerPermissions implements PermissionsModule {
  @override
  String get moduleId => 'worker';

  @override
  String get moduleName => 'Trabajadores';

  static const viewKey = 'worker.view';
  static const linkKey = 'worker.link';
  static const unlinkKey = 'worker.unlink';

  @override
  List<Permission> get permissions => [
        Permission(id: viewKey, name: 'Ver'),
        Permission(id: linkKey, name: 'Vincular'),
        Permission(id: unlinkKey, name: 'Desvincular'),
      ];

  @override
  Module toModule() => Module(name: 'Trabajadores', permissions: permissions);
}

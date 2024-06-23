import '../../company/core/interfaces/i_permissions_structure.dart';

class WorkerPermissions implements IPermissionsStructure {
  @override
  String get id => 'worker';

  @override
  String get name => 'Trabajadores';

  final viewKey = 'worker.view';
  final linkKey = 'worker.link';
  final unlinkKey = 'worker.unlink';
  final managePermissionsKey = 'worker.managePermissions';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: linkKey, name: 'Vincular'),
        PermissionModel(id: unlinkKey, name: 'Desvincular'),
        PermissionModel(id: managePermissionsKey, name: 'Gestionar permisos'),
      ];
}

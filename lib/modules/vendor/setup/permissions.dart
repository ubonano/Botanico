import '../../app/content/setup/interfaces/i_permissions_structure.dart';
export '../../app/content/setup/interfaces/i_permissions_structure.dart';

class VendorPermissions implements IPermissionsStructure {
  @override
  String get id => 'vendor';

  @override
  String get name => 'Proveedores';

  final viewKey = 'vendor.view';
  final createKey = 'vendor.create';
  final updateKey = 'vendor.update';
  final deleteKey = 'vendor.delete';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: createKey, name: 'Crear'),
        PermissionModel(id: updateKey, name: 'Actualizar'),
        PermissionModel(id: deleteKey, name: 'Eliminar'),
      ];
}

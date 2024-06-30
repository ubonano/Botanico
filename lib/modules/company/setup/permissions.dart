import '../../app/content/setup/interfaces/i_permissions_structure.dart';
export '../../app/content/setup/interfaces/i_permissions_structure.dart';

class CompanyPermissions implements IPermissionsStructure {
  @override
  String get id => 'company';

  @override
  String get name => 'Empresa';

  final updateKey = 'company.update';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: updateKey, name: 'Actualizar'),
      ];
}

import 'package:botanico/modules/foundation/module.dart';

class AccountingAccountPermissions implements ModuleStructure {
  @override
  String get moduleId => 'accounting_account';

  @override
  String get moduleName => 'Cuentas contables';

  static const viewKey = 'accounting_account.view';
  static const createKey = 'accounting_account.create';
  static const updateKey = 'accounting_account.update';
  static const deleteKey = 'accounting_account.delete';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: createKey, name: 'Crear'),
        PermissionModel(id: updateKey, name: 'Actualizar'),
        PermissionModel(id: deleteKey, name: 'Eliminar'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(name: 'Cuentas contables', permissions: permissions);
}

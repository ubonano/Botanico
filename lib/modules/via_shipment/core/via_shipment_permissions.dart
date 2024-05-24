import 'package:botanico/modules/foundation/module.dart';

class ViaShipmentModulePermissions implements ModuleStructure {
  @override
  String get moduleId => 'via_shipment';

  @override
  String get moduleName => 'Via Shipments';

  static const viewKey = 'via_shipment.view';
  static const createKey = 'via_shipment.create';
  static const updateKey = 'via_shipment.update';
  static const deleteKey = 'via_shipment.delete';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'View'),
        PermissionModel(id: createKey, name: 'Create'),
        PermissionModel(id: updateKey, name: 'Update'),
        PermissionModel(id: deleteKey, name: 'Delete'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(name: 'Via Shipments', permissions: permissions);
}

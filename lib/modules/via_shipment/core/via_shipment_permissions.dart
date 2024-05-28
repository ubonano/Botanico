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
  static const dashboardKey = 'via_shipment.dashboard';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: createKey, name: 'Crear'),
        PermissionModel(id: updateKey, name: 'Actualizar'),
        PermissionModel(id: deleteKey, name: 'Eliminar'),
        PermissionModel(id: dashboardKey, name: 'Dashboard'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(name: 'Via Shipments', permissions: permissions);
}

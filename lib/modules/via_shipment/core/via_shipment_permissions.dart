import 'package:botanico/modules/foundation/module.dart';

class ViaShipmentModulePermissions implements ModuleStructure {
  @override
  String get moduleId => 'via_shipment';

  @override
  String get moduleName => 'Envíos Via';

  static const viewKey = 'via_shipment.view';
  static const createKey = 'via_shipment.create';
  static const updateKey = 'via_shipment.update';
  static const deleteKey = 'via_shipment.delete';
  static const dashboardKey = 'via_shipment.dashboard';
  static const invoiceKey = 'via_shipment.invoice';
  static const cancelInvoiceKey = 'via_shipment.cancel_invoice';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: createKey, name: 'Crear'),
        PermissionModel(id: updateKey, name: 'Actualizar'),
        PermissionModel(id: deleteKey, name: 'Eliminar'),
        PermissionModel(id: dashboardKey, name: 'Dashboard'),
        PermissionModel(id: invoiceKey, name: 'Facturar'),
        PermissionModel(id: cancelInvoiceKey, name: 'Anular Factura'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(name: 'Envíos Via', permissions: permissions);
}

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

  static const processKey = 'via_shipment.process';
  static const prepareKey = 'via_shipment.preper';
  static const deliverKey = 'via_shipment.deliver';
  static const archiveKey = 'via_shipment.archive';

  static const changeDeliveryPlaceKey = 'via_shipment.change_delivery_place';
  static const changeStateKey = 'via_shipment.change_state';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: createKey, name: 'Crear'),
        PermissionModel(id: updateKey, name: 'Actualizar'),
        PermissionModel(id: deleteKey, name: 'Eliminar'),
        PermissionModel(id: dashboardKey, name: 'Dashboard'),
        PermissionModel(id: invoiceKey, name: 'Facturar'),
        PermissionModel(id: cancelInvoiceKey, name: 'Anular Factura'),
        PermissionModel(id: processKey, name: 'Processar envío'),
        PermissionModel(id: prepareKey, name: 'Alistar envío'),
        PermissionModel(id: deliverKey, name: 'Entregar envío'),
        PermissionModel(id: archiveKey, name: 'Archivar envío'),
        PermissionModel(id: changeStateKey, name: 'Cambiar estado'),
        PermissionModel(id: changeDeliveryPlaceKey, name: 'Cambiar lugar de entrega'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(id: moduleId, name: moduleName, permissions: permissions);
}

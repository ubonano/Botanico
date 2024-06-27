import '../../../app/content/setup/interfaces/i_permissions_structure.dart';
export '../../../app/content/setup/interfaces/i_permissions_structure.dart';

class ShipmentPermissions implements IPermissionsStructure {
  @override
  String get id => 'shipment';

  @override
  String get name => 'Envíos Via';

  final cabinetKey = 'shipment.cabinet';
  final createKey = 'shipment.create';
  final updateKey = 'shipment.update';
  final deleteKey = 'shipment.delete';
  final dashboardKey = 'shipment.dashboard';

  final invoiceKey = 'shipment.invoice';
  final cancelInvoiceKey = 'shipment.cancel_invoice';

  final processKey = 'shipment.process';
  final prepareKey = 'shipment.preper';
  final deliverKey = 'shipment.deliver';
  final archiveKey = 'shipment.archive';

  final changeDeliveryPlaceKey = 'shipment.change_delivery_place';
  final changeStateKey = 'shipment.change_state';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: cabinetKey, name: 'Ver archivo'),
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
}

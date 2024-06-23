import '../../app/setup/interfaces/i_permissions_structure.dart';
export '../../app/setup/interfaces/i_permissions_structure.dart';

class ViaShipmentPermissions implements IPermissionsStructure {
  @override
  String get id => 'via_shipment';

  @override
  String get name => 'Envíos Via';

  final viewKey = 'via_shipment.view';
  final createKey = 'via_shipment.create';
  final updateKey = 'via_shipment.update';
  final deleteKey = 'via_shipment.delete';
  final dashboardKey = 'via_shipment.dashboard';
  final invoiceKey = 'via_shipment.invoice';
  final cancelInvoiceKey = 'via_shipment.cancel_invoice';

  final processKey = 'via_shipment.process';
  final prepareKey = 'via_shipment.preper';
  final deliverKey = 'via_shipment.deliver';
  final archiveKey = 'via_shipment.archive';

  final changeDeliveryPlaceKey = 'via_shipment.change_delivery_place';
  final changeStateKey = 'via_shipment.change_state';

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
}

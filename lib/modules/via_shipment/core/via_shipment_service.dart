import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class ViaShipmentService extends GetxService with GlobalHelper implements IViaShipmentService {
  late final IViaShipmentBusinessLogic _viaShipmentBusinessLogic = Get.find();

  @override
  Future<ViaShipmentModel?> get(String id) async => await _viaShipmentBusinessLogic.get(id);

  @override
  Future<ViaShipmentModel?> getFromExternalAPI(String shipmentId) async => await operation.perform(
        operationName: 'Get shipment from External API',
        errorMessage: 'Error al obtener el envío',
        operation: (_) async => _viaShipmentBusinessLogic.getFromExternalAPI(shipmentId),
      );

  @override
  Future<void> create(ViaShipmentModel viaShipment) async => await operation.perform(
        operationName: 'Create via shipment',
        permissionKey: ViaShipmentModulePermissions.createKey,
        operation: (_) async => await _viaShipmentBusinessLogic.create(viaShipment),
        onSuccess: _viaShipmentBusinessLogic.postCreate,
      );

  @override
  Future<void> update(ViaShipmentModel viaShipment) async => await operation.perform(
        operationName: 'Update via shipment',
        permissionKey: ViaShipmentModulePermissions.updateKey,
        operation: (_) async => await _viaShipmentBusinessLogic.update(viaShipment),
        onSuccess: _viaShipmentBusinessLogic.postUpdate,
      );

  @override
  Future<void> delete(String id) async => await operation.perform(
        operationName: 'Delete via shipment',
        permissionKey: ViaShipmentModulePermissions.deleteKey,
        inTransaction: true,
        operation: (_) async => await _viaShipmentBusinessLogic.delete(id),
      );

  @override
  StreamSubscription<List<ViaShipmentModel>>? initializeStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    Function(List<ViaShipmentModel>)? onNewData,
  }) =>
      _viaShipmentBusinessLogic.initializeStream(
          list$: list$, startAfter: startAfter, limit: limit, states: states, onNewData: onNewData);

  @override
  Future<void> invoice(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.invoiceKey,
        operationName: 'Invoice shipment',
        operation: (_) async => await _viaShipmentBusinessLogic.invoice(shipment),
      );

  @override
  Future<void> cancelInvoice(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.cancelInvoiceKey,
        operationName: 'Cancel invoice shipment',
        operation: (_) async => await _viaShipmentBusinessLogic.cancelInvoice(shipment),
      );

  @override
  Future<void> archive(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.archiveKey,
        operationName: 'Archive shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.archive(shipment),
      );

  @override
  Future<void> deliver(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.deliverKey,
        operationName: 'Deliver shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.deliver(shipment),
      );

  @override
  Future<void> prepare(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.prepareKey,
        operationName: 'Prepare shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.prepare(shipment),
      );

  @override
  Future<void> process(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModulePermissions.processKey,
        operationName: 'Process shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.process(shipment),
      );

  @override
  Future<void> changeDeliveryPlace(ViaShipmentModel shipment, ViaShipmentDeliveryPlace newPlace) async =>
      await operation.perform(
        permissionKey: ViaShipmentModulePermissions.changeDeliveryPlaceKey,
        operationName: 'Change delivery place',
        operation: (_) async => await _viaShipmentBusinessLogic.changeDeliveryPlace(shipment, newPlace),
        onSuccess: _viaShipmentBusinessLogic.postUpdate,
      );
}

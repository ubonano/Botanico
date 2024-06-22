import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class ViaShipmentService extends GetxService with GlobalHelper implements IViaShipmentService {
  late final IModuleStructure _module = ViaShipmentModule();
  late final IViaShipmentBusinessLogic _viaShipmentBusinessLogic = Get.find();

  @override
  Future<ViaShipmentModel?> get(String id) async => await operation.perform(
        operationName: 'Get shipment $id',
        module: _module,
        permissionKey: ViaShipmentModule.viewKey,
        operation: (_) async => await _viaShipmentBusinessLogic.get(id),
      );

  @override
  Future<ViaShipmentModel?> getFromExternalAPI(String id) async => await operation.perform(
        operationName: 'Get shipment from External API $id',
        errorMessage: 'Error al obtener el envío $id',
        module: _module,
        operation: (_) async => _viaShipmentBusinessLogic.getFromExternalAPI(id),
      );

  @override
  Future<void> create(ViaShipmentModel shipment) async => await operation.perform(
        operationName: 'Create via shipment ${shipment.shipmentId}',
        module: _module,
        permissionKey: ViaShipmentModule.createKey,
        operation: (_) async => await _viaShipmentBusinessLogic.create(shipment),
      );

  @override
  Future<void> update(ViaShipmentModel shipment) async => await operation.perform(
        operationName: 'Update via shipment ${shipment.shipmentId}',
        module: _module,
        permissionKey: ViaShipmentModule.updateKey,
        operation: (_) async => await _viaShipmentBusinessLogic.update(shipment),
      );

  @override
  Future<void> delete(ViaShipmentModel shipment) async => await operation.perform(
        operationName: 'Delete via shipment ${shipment.shipmentId}',
        module: _module,
        permissionKey: ViaShipmentModule.deleteKey,
        operation: (_) async => await _viaShipmentBusinessLogic.delete(shipment),
      );

  @override
  Future<void> invoice(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModule.invoiceKey,
        module: _module,
        operationName: 'Invoice shipment ${shipment.shipmentId}',
        operation: (_) async => await _viaShipmentBusinessLogic.invoice(shipment),
      );

  @override
  Future<void> cancelInvoice(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModule.cancelInvoiceKey,
        module: _module,
        operationName: 'Cancel invoice shipment ${shipment.shipmentId}',
        operation: (_) async => await _viaShipmentBusinessLogic.cancelInvoice(shipment),
      );

  @override
  Future<void> archive(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModule.archiveKey,
        module: _module,
        operationName: 'Archive shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.archive(shipment),
      );

  @override
  Future<void> deliver(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModule.deliverKey,
        module: _module,
        operationName: 'Deliver shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.deliver(shipment),
      );

  @override
  Future<void> prepare(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModule.prepareKey,
        module: _module,
        operationName: 'Prepare shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.prepare(shipment),
      );

  @override
  Future<void> process(ViaShipmentModel shipment) async => await operation.perform(
        permissionKey: ViaShipmentModule.processKey,
        module: _module,
        operationName: 'Process shipment ${shipment.shipmentId}}',
        operation: (_) async => await _viaShipmentBusinessLogic.process(shipment),
      );

  @override
  Future<void> changeState(ViaShipmentModel shipment, ViaShipmentState newState,
          {bool validateTransition = true}) async =>
      await operation.perform(
        permissionKey: ViaShipmentModule.changeStateKey,
        module: _module,
        operationName: 'Change state of shipment ${shipment.shipmentId} to $newState',
        operation: (_) async => await _viaShipmentBusinessLogic.changeState(
          shipment,
          newState,
          validateTransition: validateTransition,
        ),
      );

  @override
  Future<void> changeDeliveryPlace(ViaShipmentModel shipment, ViaShipmentDeliveryPlace newPlace) async =>
      await operation.perform(
        permissionKey: ViaShipmentModule.changeDeliveryPlaceKey,
        module: _module,
        operationName: 'Change delivery place ${shipment.shipmentId}',
        operation: (_) async => await _viaShipmentBusinessLogic.changeDeliveryPlace(shipment, newPlace),
      );

  @override
  StreamSubscription<List<ViaShipmentModel>>? initStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    DateTime? fromDate,
    DateTime? toDate,
    String? shipmentId,
    bool descending = true,
    Function(List<ViaShipmentModel>)? onNewData,
  }) =>
      _viaShipmentBusinessLogic.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        states: states,
        fromDate: fromDate,
        toDate: toDate,
        shipmentId: shipmentId,
        descending: descending,
        onNewData: onNewData,
      );
}

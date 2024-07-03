import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../app/content/helpers/global_helper.dart';
import 'setup/interfaces/i_shipment_business_logic.dart';
import 'setup/interfaces/i_shipment_service.dart';
import 'setup/module.dart';

class ShipmentService extends GetxService with GlobalHelper implements IShipmentService {
  late final IShipmentBusinessLogic _shipmentBusinessLogic = Get.find();

  @override
  Future<ShipmentModel?> get(String id) async => await operation.perform(
        operationName: 'Get shipment $id',
        moduleId: ShipmentModule.moduleId,
        permissionKey: ShipmentKeys.cabinet.id,
        operation: (_) async => await _shipmentBusinessLogic.get(id),
      );

  @override
  Future<ShipmentModel?> getFromExternalAPI(String id) async => await operation.perform(
        operationName: 'Get shipment from External API $id',
        errorMessage: 'Error al obtener el envío $id',
        moduleId: ShipmentModule.moduleId,
        operation: (_) async => _shipmentBusinessLogic.getFromExternalAPI(id),
      );

  @override
  Future<void> create(ShipmentModel shipment) async => await operation.perform(
        operationName: 'Create shipment ${shipment.shipmentId}',
        moduleId: ShipmentModule.moduleId,
        permissionKey: ShipmentKeys.create.id,
        operation: (_) async => await _shipmentBusinessLogic.create(shipment),
      );

  @override
  Future<void> update(ShipmentModel shipment) async => await operation.perform(
        operationName: 'Update shipment ${shipment.shipmentId}',
        moduleId: ShipmentModule.moduleId,
        permissionKey: ShipmentKeys.update.id,
        operation: (_) async => await _shipmentBusinessLogic.update(shipment),
      );

  @override
  Future<void> delete(ShipmentModel shipment) async => await operation.perform(
        operationName: 'Delete shipment ${shipment.shipmentId}',
        moduleId: ShipmentModule.moduleId,
        permissionKey: ShipmentKeys.delete.id,
        operation: (_) async => await _shipmentBusinessLogic.delete(shipment),
      );

  @override
  Future<void> invoice(ShipmentModel shipment) async => await operation.perform(
        permissionKey: ShipmentKeys.invoice.id,
        moduleId: ShipmentModule.moduleId,
        operationName: 'Invoice shipment ${shipment.shipmentId}',
        operation: (_) async => await _shipmentBusinessLogic.invoice(shipment),
      );

  @override
  Future<void> cancelInvoice(ShipmentModel shipment) async => await operation.perform(
        permissionKey: ShipmentKeys.cancelInvoice.id,
        moduleId: ShipmentModule.moduleId,
        operationName: 'Cancel invoice shipment ${shipment.shipmentId}',
        operation: (_) async => await _shipmentBusinessLogic.cancelInvoice(shipment),
      );

  @override
  Future<void> archive(ShipmentModel shipment) async => await operation.perform(
        permissionKey: ShipmentKeys.archive.id,
        moduleId: ShipmentModule.moduleId,
        operationName: 'Archive shipment ${shipment.shipmentId}}',
        operation: (_) async => await _shipmentBusinessLogic.archive(shipment),
      );

  @override
  Future<void> cancel(ShipmentModel shipment) async => await operation.perform(
        permissionKey: ShipmentKeys.cancel.id,
        moduleId: ShipmentModule.moduleId,
        operationName: 'Cancel shipment ${shipment.shipmentId}}',
        operation: (_) async => await _shipmentBusinessLogic.cancel(shipment),
      );

  @override
  Future<void> deliver(ShipmentModel shipment) async => await operation.perform(
        permissionKey: ShipmentKeys.deliver.id,
        moduleId: ShipmentModule.moduleId,
        operationName: 'Deliver shipment ${shipment.shipmentId}}',
        operation: (_) async => await _shipmentBusinessLogic.deliver(shipment),
      );

  @override
  Future<void> prepare(ShipmentModel shipment) async => await operation.perform(
        permissionKey: ShipmentKeys.prepare.id,
        moduleId: ShipmentModule.moduleId,
        operationName: 'Prepare shipment ${shipment.shipmentId}}',
        operation: (_) async => await _shipmentBusinessLogic.prepare(shipment),
      );

  @override
  Future<void> process(ShipmentModel shipment) async => await operation.perform(
        permissionKey: ShipmentKeys.process.id,
        moduleId: ShipmentModule.moduleId,
        operationName: 'Process shipment ${shipment.shipmentId}}',
        operation: (_) async => await _shipmentBusinessLogic.process(shipment),
      );

  @override
  Future<void> changeState(ShipmentModel shipment, ShipmentState newState, {bool validateTransition = true}) async =>
      await operation.perform(
        permissionKey: ShipmentKeys.changeState.id,
        moduleId: ShipmentModule.moduleId,
        operationName: 'Change state of shipment ${shipment.shipmentId} to $newState',
        operation: (_) async => await _shipmentBusinessLogic.changeState(
          shipment,
          newState,
          validateTransition: validateTransition,
        ),
      );

  @override
  Future<void> changeDeliveryPlace(ShipmentModel shipment, ShipmentDeliveryPlace newPlace) async =>
      await operation.perform(
        permissionKey: ShipmentKeys.changeDeliveryPlace.id,
        moduleId: ShipmentModule.moduleId,
        operationName: 'Change delivery place ${shipment.shipmentId}',
        operation: (_) async => await _shipmentBusinessLogic.changeDeliveryPlace(shipment, newPlace),
      );

  @override
  StreamSubscription<List<ShipmentModel>>? initStream({
    required RxList<ShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ShipmentState>? states,
    DateTime? fromDate,
    DateTime? toDate,
    String? shipmentId,
    bool descending = true,
    Function(List<ShipmentModel>)? onNewData,
  }) =>
      _shipmentBusinessLogic.initStream(
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

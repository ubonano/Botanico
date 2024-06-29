import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../worker/content/setup/interfaces/i_worker_service.dart';
import 'content/setup/interfaces/i_via_cargo_api_repository.dart';
import 'content/setup/interfaces/i_shipment_business_logic.dart';
import 'content/setup/interfaces/i_shipment_repository.dart';

class ShipmentBusinessLogic implements IShipmentBusinessLogic {
  late final IShipmentRepository _shipmentRepo = Get.find();
  late final IViaCargoApiRepository _viaCargoApiRepo = Get.find();

  @override
  Future<ShipmentModel?> get(String id) async => _shipmentRepo.get(id);

  @override
  Future<ShipmentModel?> getFromExternalAPI(String shipmentId) async =>
      await _viaCargoApiRepo.getTrackingData(numeroEnvio: shipmentId);

  @override
  Future<void> create(ShipmentModel shipment) async {
    final newShipment = shipment.copyWith(id: _shipmentRepo.generateId);
    final loggedShipment = await _logAction(newShipment, 'Creación de envío');
    await _shipmentRepo.create(loggedShipment);
  }

  @override
  Future<void> update(ShipmentModel shipment) async => await _shipmentRepo.update(shipment);

  @override
  Future<void> delete(ShipmentModel shipment) async => await _shipmentRepo.delete(shipment);

  @override
  Future<void> invoice(ShipmentModel shipment) async {
    final updatedShipment = await _logAction(shipment.invoice(), 'Facturación');
    await _shipmentRepo.update(updatedShipment);
  }

  @override
  Future<void> cancelInvoice(ShipmentModel shipment) async {
    final updatedShipment = await _logAction(shipment.cancelInvoice(), 'Cancelación de facturación');
    await _shipmentRepo.update(updatedShipment);
  }

  @override
  Future<void> process(ShipmentModel shipment) async => await changeState(shipment, ShipmentState.inProcess);

  @override
  Future<void> prepare(ShipmentModel shipment) async => await changeState(shipment, ShipmentState.ready);

  @override
  Future<void> deliver(ShipmentModel shipment) async => shipment.isInvoiced
      ? await changeState(shipment, ShipmentState.delivered)
      : throw Exception('No es posible entregar un envío que no ha sido facturado.');

  @override
  Future<void> archive(ShipmentModel shipment) async =>
      await changeState(shipment, ShipmentState.archived, validateTransition: false);

  @override
  Future<void> cancel(ShipmentModel shipment) async =>
      await changeState(shipment, ShipmentState.canceled, validateTransition: false);

  @override
  Future<void> changeState(
    ShipmentModel shipment,
    ShipmentState newState, {
    bool validateTransition = true,
  }) async {
    if (!validateTransition || _canTransition(shipment.state, newState)) {
      var oldState = shipment.state;
      final updatedShipment = await _logAction(
        shipment.changeState(newState),
        'Cambio de estado: ${oldState.label} a ${newState.label}',
      );
      await _shipmentRepo.update(updatedShipment);
    } else {
      throw Exception('No se puede pasar de ${shipment.state} a $newState');
    }
  }

  bool _canTransition(ShipmentState currentState, ShipmentState newState) => newState.index == currentState.index + 1;

  @override
  Future<void> changeDeliveryPlace(ShipmentModel shipment, ShipmentDeliveryPlace newPlace) async {
    final updatedShipment = await _logAction(
      shipment.changeDeliveryPlace(newPlace),
      'Cambio de lugar de entrega a ${deliveryPlaceToString(newPlace)}',
    );
    await _shipmentRepo.update(updatedShipment);
  }

  Future<ShipmentModel> _logAction(ShipmentModel shipment, String action) async {
    final loggedWorker = Get.find<IWorkerService>().currentWorker$;

    final newLog = ActionLogModel(action: action, timestamp: DateTime.now(), user: loggedWorker!.name);
    final updatedLogs = List<ActionLogModel>.from(shipment.actionLogs)..add(newLog);
    return shipment.copyWith(actionLogs: updatedLogs);
  }

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
      _shipmentRepo
          .iniStream(
              startAfter: startAfter,
              limit: limit,
              states: states,
              fromDate: fromDate,
              toDate: toDate,
              shipmentId: shipmentId,
              descending: descending)
          .listen(
        (shipmentList) {
          startAfter == null ? list$.value = shipmentList : list$.addAll(shipmentList);
          onNewData?.call(shipmentList);
        },
      );
}

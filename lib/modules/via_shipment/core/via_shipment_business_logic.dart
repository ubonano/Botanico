import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

import '../module.dart';

class ViaShipmentBusinessLogic implements IViaShipmentBusinessLogic {
  late final IViaShipmentRepository _viaShipmentRepo = Get.find();
  late final IViaCargoRepository _viaCargoRepo = Get.find();

  @override
  Future<ViaShipmentModel?> get(String id) async => _viaShipmentRepo.get(id);

  @override
  Future<ViaShipmentModel?> getFromExternalAPI(String shipmentId) async {
    final token = await _viaCargoRepo.getToken();

    if (token != null) {
      final trackingData = await _viaCargoRepo.getTrackingData(numeroEnvio: shipmentId);

      if (trackingData != null) {
        return trackingData;
      } else {
        throw Exception('Error al obtener los datos de tracking');
      }
    } else {
      throw Exception('Error al obtener el token');
    }
  }

  @override
  Future<void> create(ViaShipmentModel shipment) async =>
      await _viaShipmentRepo.create(shipment.copyWith(id: _viaShipmentRepo.generateId));

  @override
  Future<void> update(ViaShipmentModel shipment) async => await _viaShipmentRepo.update(shipment);

  @override
  Future<void> delete(ViaShipmentModel shipment) async => await _viaShipmentRepo.delete(shipment);

  Future<ViaShipmentModel> _logAction(ViaShipmentModel shipment, String action) async {
    final loggedWorker = Get.find<IWorkerService>().loggedWorker$;

    final newLog = ActionLogModel(action: action, timestamp: DateTime.now(), user: loggedWorker!.name);
    final updatedLogs = List<ActionLogModel>.from(shipment.actionLogs)..add(newLog);
    return shipment.copyWith(actionLogs: updatedLogs);
  }

  @override
  Future<void> invoice(ViaShipmentModel shipment) async {
    final updatedShipment = await _logAction(shipment.invoice(), 'Facturación');
    await _viaShipmentRepo.update(updatedShipment);
  }

  @override
  Future<void> cancelInvoice(ViaShipmentModel shipment) async {
    final updatedShipment = await _logAction(shipment.cancelInvoice(), 'Cancelación de facturación');
    await _viaShipmentRepo.update(updatedShipment);
  }

  @override
  Future<void> process(ViaShipmentModel shipment) async => await changeState(shipment, ViaShipmentState.inProcess);

  @override
  Future<void> prepare(ViaShipmentModel shipment) async => await changeState(shipment, ViaShipmentState.ready);

  @override
  Future<void> deliver(ViaShipmentModel shipment) async => shipment.isInvoiced
      ? await changeState(shipment, ViaShipmentState.delivered)
      : throw Exception('No es posible entregar un envío que no ha sido facturado.');

  @override
  Future<void> archive(ViaShipmentModel shipment) async => await changeState(shipment, ViaShipmentState.archived);

  @override
  Future<void> changeState(ViaShipmentModel shipment, ViaShipmentState newState) async {
    if (_canTransition(shipment.state, newState)) {
      final updatedShipment =
          await _logAction(shipment.changeState(newState), 'Cambio de estado a ${viaShipmentStateLabels[newState]}');
      await _viaShipmentRepo.update(updatedShipment);
    } else {
      throw Exception('No se puede pasar de ${shipment.state} a $newState');
    }
  }

  bool _canTransition(int currentState, ViaShipmentState newState) => newState.index == currentState + 1;

  @override
  Future<void> changeDeliveryPlace(ViaShipmentModel shipment, ViaShipmentDeliveryPlace newPlace) async {
    final updatedShipment = await _logAction(
        shipment.changeDeliveryPlace(newPlace), 'Cambio de lugar de entrega a ${deliveryPlaceToString(newPlace)}');
    await _viaShipmentRepo.update(updatedShipment);
  }

  @override
  StreamSubscription<List<ViaShipmentModel>>? initStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    Function(List<ViaShipmentModel>)? onNewData,
  }) =>
      _viaShipmentRepo.iniStream(startAfter: startAfter, limit: limit, states: states).listen(
        (viaShipmentList) {
          startAfter == null ? list$.value = viaShipmentList : list$.addAll(viaShipmentList);
          onNewData?.call(viaShipmentList);
        },
      );
}

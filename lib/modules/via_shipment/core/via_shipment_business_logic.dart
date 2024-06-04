import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class ViaShipmentBusinessLogic with GlobalHelper implements IViaShipmentBusinessLogic {
  late final IViaShipmentRepository _viaShipmentRepo = Get.find();
  late final IViaCargoRepository _viaCargoRepo = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

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
  Future<void> create(ViaShipmentModel viaShipment) async =>
      await _viaShipmentRepo.create(viaShipment.copyWith(id: _viaShipmentRepo.generateId));

  @override
  Future<void> update(ViaShipmentModel viaShipment) async => await _viaShipmentRepo.update(viaShipment);

  @override
  Future<void> delete(String id) async => await _viaShipmentRepo.delete(id);

  @override
  Future<void> postCreate() async => navigate.back();

  @override
  Future<void> postUpdate() async => navigate.back();

  @override
  Future<void> invoice(ViaShipmentModel shipment) async => await _viaShipmentRepo.update(shipment.invoice());

  @override
  Future<void> cancelInvoice(ViaShipmentModel shipment) async =>
      await _viaShipmentRepo.update(shipment.cancelInvoice());

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
  Future<void> changeState(ViaShipmentModel shipment, ViaShipmentState newState) async =>
      _canTransition(shipment.state, newState)
          ? await _viaShipmentRepo.update(shipment.changeState(newState))
          : throw Exception('No se puede pasar de ${shipment.state} a $newState');

  bool _canTransition(int currentState, ViaShipmentState newState) => newState.index == currentState + 1;

  @override
  Future<void> changeDeliveryPlace(ViaShipmentModel shipment, ViaShipmentDeliveryPlace newPlace) async =>
      await _viaShipmentRepo.update(shipment.changeDeliveryPlace(newPlace));

  @override
  StreamSubscription<List<ViaShipmentModel>>? initializeStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    Function(List<ViaShipmentModel>)? onNewData,
  }) =>
      _viaShipmentRepo
          .listStream(_companyBusinessLogic.currentCompanyId, startAfter: startAfter, limit: limit, states: states)
          .listen(
        (viaShipmentList) {
          startAfter == null ? list$.value = viaShipmentList : list$.addAll(viaShipmentList);
          onNewData?.call(viaShipmentList);
        },
      );
}

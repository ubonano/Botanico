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
  Future<void> postCreate() async => navigate.toViaShipmentList();

  @override
  Future<void> postUpdate() async => navigate.toViaShipmentList();

  @override
  StreamSubscription<List<ViaShipmentModel>>? initializeStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    Function(List<ViaShipmentModel>)? onNewData,
  }) {
    return _viaShipmentRepo
        .listStream(_companyBusinessLogic.currentCompanyId, startAfter: startAfter, limit: limit, states: states)
        .listen(
      (viaShipmentList) {
        if (startAfter == null) {
          list$.value = viaShipmentList;
        } else {
          list$.addAll(viaShipmentList);
        }
        onNewData?.call(viaShipmentList);
      },
    );
  }

  @override
  Future<void> invoiceShipment(ViaShipmentModel shipment) async =>
      await _viaShipmentRepo.update(shipment.copyWith(isInvoiced: true));

  @override
  Future<void> cancelInvoiceShipment(ViaShipmentModel shipment) async =>
      await _viaShipmentRepo.update(shipment.copyWith(isInvoiced: false));
}

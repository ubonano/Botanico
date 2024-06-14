import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../module.dart';

abstract class IViaShipmentBusinessLogic {
  Future<ViaShipmentModel?> get(String id);
  Future<ViaShipmentModel?> getFromExternalAPI(String id);
  Future<void> create(ViaShipmentModel shipment);
  Future<void> update(ViaShipmentModel shipment);
  Future<void> delete(ViaShipmentModel shipment);
  Future<void> invoice(ViaShipmentModel shipment);
  Future<void> cancelInvoice(ViaShipmentModel shipment);
  Future<void> process(ViaShipmentModel shipment);
  Future<void> prepare(ViaShipmentModel shipment);
  Future<void> deliver(ViaShipmentModel shipment);
  Future<void> archive(ViaShipmentModel shipment);
  Future<void> changeState(ViaShipmentModel shipment, ViaShipmentState newState, {bool validateTransition = true});
  Future<void> changeDeliveryPlace(ViaShipmentModel shipment, ViaShipmentDeliveryPlace newPlace);
  StreamSubscription<List<ViaShipmentModel>>? initStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    Function(List<ViaShipmentModel>)? onNewData,
  });
}

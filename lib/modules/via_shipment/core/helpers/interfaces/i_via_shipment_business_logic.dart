import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../module.dart';

abstract class IViaShipmentBusinessLogic {
  Future<ViaShipmentModel?> get(String id);
  Future<ViaShipmentModel?> getFromExternalAPI(String id);
  Future<void> create(ViaShipmentModel shipment);
  Future<void> update(ViaShipmentModel shipment);
  Future<void> delete(String id);
  Future<void> postCreate();
  Future<void> postUpdate();
  StreamSubscription<List<ViaShipmentModel>>? initializeStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    Function(List<ViaShipmentModel>)? onNewData,
  });
  Future<void> invoiceShipment(ViaShipmentModel shipment);
  Future<void> cancelInvoiceShipment(ViaShipmentModel shipment);
  Future<void> archiveShipment(ViaShipmentModel shipment);
}

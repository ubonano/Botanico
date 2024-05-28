import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../module.dart';

abstract class IViaShipmentBusinessLogic {
  RxList<ViaShipmentModel> get viaShipmentList$;

  Future<ViaShipmentModel?> get(String id);
  Future<void> createViaShipment(ViaShipmentModel viaShipment);
  Future<void> updateViaShipment(ViaShipmentModel viaShipment);
  Future<void> deleteViaShipment(String id);
  Future<void> postCreateViaShipment();
  Future<void> postUpdateViaShipment();
  Future<void> initializePaginatedViaShipmentStream_V2({
    required RxList<ViaShipmentModel> list$,
    required StreamSubscription<List<ViaShipmentModel>>? subscription,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
  });
  Future<ViaShipmentModel?> getShipmentFromExternalAPI(String shipmentId);
  void cancelViaShipmentStream();
}

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/shipment_model.dart';

export '../../model/shipment_model.dart';
export '../../model/enums/shipment_state.dart';
export '../../model/enums/shipment_delivery_place.dart';

abstract class IShipmentService {
  Future<ShipmentModel?> get(String id);
  Future<ShipmentModel?> getFromExternalAPI(String id);
  Future<void> create(ShipmentModel shipment);
  Future<void> update(ShipmentModel shipment);
  Future<void> delete(ShipmentModel shipment);
  Future<void> invoice(ShipmentModel shipment);
  Future<void> cancelInvoice(ShipmentModel shipment);
  Future<void> process(ShipmentModel shipment);
  Future<void> prepare(ShipmentModel shipment);
  Future<void> deliver(ShipmentModel shipment);
  Future<void> archive(ShipmentModel shipment);
  Future<void> changeState(ShipmentModel shipment, ShipmentState newState, {bool validateTransition = true});
  Future<void> changeDeliveryPlace(ShipmentModel shipment, ShipmentDeliveryPlace newPlace);
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
  });
}

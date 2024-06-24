import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/via_shipment_model.dart';

export '../../model/via_shipment_model.dart';
export '../../model/enums/via_shipment_state.dart';
export '../../model/enums/via_shipment_delivery_place.dart';

abstract class IViaShipmentRepository {
  String get generateId;

  Future<ViaShipmentModel?> get(String id);
  Future<void> create(ViaShipmentModel shipment, {Transaction? txn});
  Future<void> update(ViaShipmentModel shipment, {Transaction? txn});
  Future<void> delete(ViaShipmentModel shipment, {Transaction? txn});
  Stream<List<ViaShipmentModel>> iniStream({
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    DateTime? fromDate,
    DateTime? toDate,
    String? shipmentId,
    bool descending = true,
  });
}

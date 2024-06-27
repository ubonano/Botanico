import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/shipment_model.dart';

export '../../model/shipment_model.dart';
export '../../model/enums/shipment_state.dart';
export '../../model/enums/shipment_delivery_place.dart';

abstract class IShipmentRepository {
  String get generateId;

  Future<ShipmentModel?> get(String id);
  Future<void> create(ShipmentModel shipment, {Transaction? txn});
  Future<void> update(ShipmentModel shipment, {Transaction? txn});
  Future<void> delete(ShipmentModel shipment, {Transaction? txn});
  Stream<List<ShipmentModel>> iniStream({
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ShipmentState>? states,
    DateTime? fromDate,
    DateTime? toDate,
    String? shipmentId,
    bool descending = true,
  });
}

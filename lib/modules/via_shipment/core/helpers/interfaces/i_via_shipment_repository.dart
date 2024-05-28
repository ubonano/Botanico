import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class IViaShipmentRepository {
  String get generateId;

  Future<ViaShipmentModel?> get(String id);
  Future<void> create(ViaShipmentModel viaShipment, {Transaction? txn});
  Future<void> update(ViaShipmentModel viaShipment, {Transaction? txn});
  Future<void> delete(String id, {Transaction? txn});
  Stream<List<ViaShipmentModel>> viaShipmentListStream(
    String companyId, {
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
  });
}

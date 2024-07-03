import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/vendor_model.dart';
export '../model/vendor_model.dart';

abstract class IVendorRepository {
  String get generateId;

  Future<VendorModel?> get(String id);
  Future<void> create(VendorModel vendor, {Transaction? txn});
  Future<void> update(VendorModel vendor, {Transaction? txn});
  Future<void> delete(VendorModel vendor, {Transaction? txn});
  Stream<List<VendorModel>> initStream({DocumentSnapshot? startAfter, int limit = 20});
}

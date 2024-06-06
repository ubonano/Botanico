import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class IVendorRepository {
  String get generateId;

  Future<VendorModel?> get(String id);
  Future<void> create(VendorModel vendor, {Transaction? txn});
  Future<void> update(VendorModel vendor, {Transaction? txn});
  Future<void> delete(String id, {Transaction? txn});
  Stream<List<VendorModel>> initializeStream(String companyId);
}

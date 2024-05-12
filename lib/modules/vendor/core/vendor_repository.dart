import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class VendorRepository implements IVendorRepository {
  late final FirebaseFirestore _firestore = Get.find();

  String get _companyId => Get.find<ICompanyBusinessLogic>().currentCompanyId;

  @override
  String get generateId => _vendorsRef(_companyId).doc().id;

  @override
  Future<VendorModel?> get(String id) async {
    final docSnapshot = await _vendorsRef(_companyId).doc(id).get();
    return docSnapshot.exists ? VendorModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(VendorModel vendor, {Transaction? txn}) async {
    DocumentReference docRef = _vendorsRef(_companyId).doc(vendor.uid);
    txn != null ? txn.set(docRef, vendor.toMap()) : await docRef.set(vendor.toMap());
  }

  @override
  Future<void> delete(String id, {Transaction? txn}) async {
    final docRef = _vendorsRef(_companyId).doc(id);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  @override
  Stream<List<VendorModel>> vendorListStream(String companyId) =>
      _vendorsRef(companyId).snapshots().map((snapshot) => snapshot.docs.map(VendorModel.fromSnapshot).toList());

  CollectionReference<Map<String, dynamic>> _vendorsRef(String companyId) =>
      _firestore.collection(FirestoreCollections.companies).doc(companyId).collection(FirestoreCollections.vendors);
}

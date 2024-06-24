import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../company/content/setup/interfaces/i_company_business_logic.dart';
import 'content/setup/interfaces/i_vendor_repository.dart';

class VendorRepository implements IVendorRepository {
  late final FirebaseFirestore _firestore = Get.find();

  String get _companyId => Get.find<ICompanyBusinessLogic>().currentCompany$!.uid;

  @override
  String get generateId => _vendorsRef().doc().id;

  @override
  Future<VendorModel?> get(String id) async {
    final docSnapshot = await _vendorsRef().doc(id).get();
    return docSnapshot.exists ? VendorModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(VendorModel vendor, {Transaction? txn}) async {
    DocumentReference docRef = _vendorsRef().doc(vendor.uid);
    txn != null ? txn.set(docRef, vendor.toMap()) : await docRef.set(vendor.toMap());
  }

  @override
  Future<void> update(VendorModel vendor, {Transaction? txn}) async {
    final docRef = _vendorsRef().doc(vendor.uid);
    txn != null ? txn.update(docRef, vendor.toMap()) : await docRef.update(vendor.toMap());
  }

  @override
  Future<void> delete(VendorModel vendor, {Transaction? txn}) async {
    final docRef = _vendorsRef().doc(vendor.uid);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  @override
  Stream<List<VendorModel>> initStream({DocumentSnapshot? startAfter, int limit = 20}) {
    var query = _vendorsRef().limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    return query.snapshots().map((snapshot) => snapshot.docs.map(VendorModel.fromSnapshot).toList());
  }

  CollectionReference<Map<String, dynamic>> _vendorsRef() =>
      _firestore.collection(CompanyModel.collectionName).doc(_companyId).collection(VendorModel.collectionName);
}

import 'package:botanico/modules/foundation/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../module.dart';

class VendorRepository implements IVendorRepository {
  final FirebaseFirestore _firestore = Get.find();

  CollectionReference<Map<String, dynamic>> _vendorsRef(String companyId) =>
      _firestore.collection(FirestoreCollections.companies).doc(companyId).collection(FirestoreCollections.vendors);
}

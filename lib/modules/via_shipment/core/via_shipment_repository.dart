import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class ViaShipmentRepository implements IViaShipmentRepository {
  late final FirebaseFirestore _firestore = Get.find();

  String get _companyId => Get.find<ICompanyBusinessLogic>().currentCompanyId;

  @override
  String get generateId => _viaShipmentsRef(_companyId).doc().id;

  @override
  Future<ViaShipmentModel?> get(String id) async {
    final docSnapshot = await _viaShipmentsRef(_companyId).doc(id).get();
    return docSnapshot.exists ? ViaShipmentModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(ViaShipmentModel viaShipment, {Transaction? txn}) async {
    DocumentReference docRef = _viaShipmentsRef(_companyId).doc(viaShipment.id);
    txn != null ? txn.set(docRef, viaShipment.toMap()) : await docRef.set(viaShipment.toMap());
  }

  @override
  Future<void> update(ViaShipmentModel viaShipment, {Transaction? txn}) async {
    final docRef = _viaShipmentsRef(_companyId).doc(viaShipment.id);
    txn != null ? txn.update(docRef, viaShipment.toMap()) : await docRef.update(viaShipment.toMap());
  }

  @override
  Future<void> delete(String id, {Transaction? txn}) async {
    final docRef = _viaShipmentsRef(_companyId).doc(id);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  @override
  Stream<List<ViaShipmentModel>> listStream(
    String companyId, {
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
  }) {
    var query = _viaShipmentsRef(companyId)
        .orderBy(FieldKeys.state, descending: false)
        .orderBy(FieldKeys.createdDateTime, descending: true)
        .limit(limit);

    if (states != null && states.isNotEmpty) {
      print(states.map((state) => state.value).toList());
      query = query.where(FieldKeys.state, whereIn: states.map((state) => state.value).toList());
    }

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    return query.snapshots().map((snapshot) => snapshot.docs.map(ViaShipmentModel.fromSnapshot).toList());
  }

  CollectionReference<Map<String, dynamic>> _viaShipmentsRef(String companyId) => _firestore
      .collection(FirestoreCollections.companies)
      .doc(companyId)
      .collection(FirestoreCollections.viaShipments);
}

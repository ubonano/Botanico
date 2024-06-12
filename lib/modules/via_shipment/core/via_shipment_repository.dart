import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class ViaShipmentRepository implements IViaShipmentRepository {
  late final FirebaseFirestore _firestore = Get.find();

  String get _companyId => Get.find<ICompanyBusinessLogic>().currentCompany$!.uid;

  @override
  String get generateId => _viaShipmentsRef().doc().id;

  @override
  Future<ViaShipmentModel?> get(String id) async {
    final docSnapshot = await _viaShipmentsRef().doc(id).get();
    return docSnapshot.exists ? ViaShipmentModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(ViaShipmentModel shipment, {Transaction? txn}) async {
    DocumentReference docRef = _viaShipmentsRef().doc(shipment.id);
    txn != null ? txn.set(docRef, shipment.toMap()) : await docRef.set(shipment.toMap());
  }

  @override
  Future<void> update(ViaShipmentModel shipment, {Transaction? txn}) async {
    final docRef = _viaShipmentsRef().doc(shipment.id);
    txn != null ? txn.update(docRef, shipment.toMap()) : await docRef.update(shipment.toMap());
  }

  @override
  Future<void> delete(ViaShipmentModel shipment, {Transaction? txn}) async {
    final docRef = _viaShipmentsRef().doc(shipment.id);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  @override
  Stream<List<ViaShipmentModel>> iniStream({
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
  }) {
    var query = _viaShipmentsRef().orderBy(FieldKeys.createdDateTime, descending: true).limit(limit);

    if (states != null && states.isNotEmpty) {
      query = query.where(FieldKeys.state, whereIn: states.map((state) => state.value).toList());
    }

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    return query.snapshots().map((snapshot) => snapshot.docs.map(ViaShipmentModel.fromSnapshot).toList());
  }

  CollectionReference<Map<String, dynamic>> _viaShipmentsRef() =>
      _firestore.collection(CompanyModel.collectionName).doc(_companyId).collection(ViaShipmentModel.collectionName);
}

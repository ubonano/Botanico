import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../app/content/setup/fields_key.dart';
import '../company/setup/interfaces/i_company_business_logic.dart';
import 'setup/interfaces/i_shipment_repository.dart';

class ShipmentRepository implements IShipmentRepository {
  late final FirebaseFirestore _firestore = Get.find();

  String get _companyId => Get.find<ICompanyBusinessLogic>().currentCompany$!.uid;

  @override
  String get generateId => _shipmentsRef().doc().id;

  @override
  Future<ShipmentModel?> get(String id) async {
    final docSnapshot = await _shipmentsRef().doc(id).get();
    return docSnapshot.exists ? ShipmentModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(ShipmentModel shipment, {Transaction? txn}) async {
    DocumentReference docRef = _shipmentsRef().doc(shipment.id);
    txn != null ? txn.set(docRef, shipment.toMap()) : await docRef.set(shipment.toMap());
  }

  @override
  Future<void> update(ShipmentModel shipment, {Transaction? txn}) async {
    final docRef = _shipmentsRef().doc(shipment.id);
    txn != null ? txn.update(docRef, shipment.toMap()) : await docRef.update(shipment.toMap());
  }

  @override
  Future<void> delete(ShipmentModel shipment, {Transaction? txn}) async {
    final docRef = _shipmentsRef().doc(shipment.id);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  @override
  Stream<List<ShipmentModel>> iniStream({
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ShipmentState>? states,
    DateTime? fromDate,
    DateTime? toDate,
    String? shipmentId,
    bool descending = true,
  }) {
    var query = _shipmentsRef().orderBy(FieldKeys.createdDateTime, descending: descending).limit(limit);

    if (states != null && states.isNotEmpty) {
      query = query.where(FieldKeys.state, whereIn: states.map((state) => state.value).toList());
    }

    if (startAfter != null) query = query.startAfterDocument(startAfter);

    if (fromDate != null) query = query.where(FieldKeys.createdDateTime, isGreaterThanOrEqualTo: fromDate);

    if (toDate != null) query = query.where(FieldKeys.createdDateTime, isLessThanOrEqualTo: toDate);

    if (shipmentId != null) query = query.where(FieldKeys.shipmentId, isEqualTo: shipmentId);

    return query.snapshots().map((snapshot) => snapshot.docs.map(ShipmentModel.fromSnapshot).toList());
  }

  CollectionReference<Map<String, dynamic>> _shipmentsRef() =>
      _firestore.collection(CompanyModel.collectionName).doc(_companyId).collection(ShipmentModel.collectionName);
}

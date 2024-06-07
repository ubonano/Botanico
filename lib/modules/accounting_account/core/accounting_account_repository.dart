import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class AccountingAccountRepository implements IAccountingAccountRepository {
  late final FirebaseFirestore _firestore = Get.find();

  String get _companyId => Get.find<ICompanyBusinessLogic>().currentCompanyId;

  @override
  String get generateId => _accountingAccountsRef(_companyId).doc().id;

  @override
  Future<AccountingAccountModel?> get(String id) async {
    final docSnapshot = await _accountingAccountsRef(_companyId).doc(id).get();
    return docSnapshot.exists ? AccountingAccountModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(AccountingAccountModel accountingAccount, {Transaction? txn}) async {
    DocumentReference docRef = _accountingAccountsRef(_companyId).doc(accountingAccount.uid);
    txn != null ? txn.set(docRef, accountingAccount.toMap()) : await docRef.set(accountingAccount.toMap());
  }

  @override
  Future<void> update(AccountingAccountModel accountingAccount, {Transaction? txn}) async {
    final docRef = _accountingAccountsRef(_companyId).doc(accountingAccount.uid);
    txn != null ? txn.update(docRef, accountingAccount.toMap()) : await docRef.update(accountingAccount.toMap());
  }

  @override
  Future<void> delete(AccountingAccountModel accountingAccount, {Transaction? txn}) async {
    final docRef = _accountingAccountsRef(_companyId).doc(accountingAccount.uid);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  @override
  Stream<List<AccountingAccountModel>> initializeStream(
    String companyId, {
    DocumentSnapshot? startAfter,
    int limit = 20,
  }) {
    var query = _accountingAccountsRef(companyId).limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    return query.snapshots().map((snapshot) => snapshot.docs.map(AccountingAccountModel.fromSnapshot).toList());
  }

  CollectionReference<Map<String, dynamic>> _accountingAccountsRef(String companyId) => _firestore
      .collection(FirestoreCollections.companies)
      .doc(companyId)
      .collection(FirestoreCollections.accountingAccounts);
}

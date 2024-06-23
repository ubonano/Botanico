import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../company/setup/interfaces/i_company_business_logic.dart';
import '../setup/interfaces/i_accounting_account_repository.dart';

class AccountingAccountRepository implements IAccountingAccountRepository {
  late final FirebaseFirestore _firestore = Get.find();

  String get _companyId => Get.find<ICompanyBusinessLogic>().currentCompany$!.uid;

  @override
  String get generateId => _accountingAccountsRef().doc().id;

  @override
  Future<AccountingAccountModel?> get(String id) async {
    final docSnapshot = await _accountingAccountsRef().doc(id).get();
    return docSnapshot.exists ? AccountingAccountModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(AccountingAccountModel accountingAccount, {Transaction? txn}) async {
    DocumentReference docRef = _accountingAccountsRef().doc(accountingAccount.uid);
    txn != null ? txn.set(docRef, accountingAccount.toMap()) : await docRef.set(accountingAccount.toMap());
  }

  @override
  Future<void> update(AccountingAccountModel accountingAccount, {Transaction? txn}) async {
    final docRef = _accountingAccountsRef().doc(accountingAccount.uid);
    txn != null ? txn.update(docRef, accountingAccount.toMap()) : await docRef.update(accountingAccount.toMap());
  }

  @override
  Future<void> delete(AccountingAccountModel accountingAccount, {Transaction? txn}) async {
    final docRef = _accountingAccountsRef().doc(accountingAccount.uid);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  @override
  Stream<List<AccountingAccountModel>> initStream({DocumentSnapshot? startAfter, int limit = 20}) {
    var query = _accountingAccountsRef().limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    return query.snapshots().map((snapshot) => snapshot.docs.map(AccountingAccountModel.fromSnapshot).toList());
  }

  CollectionReference<Map<String, dynamic>> _accountingAccountsRef() => _firestore
      .collection(CompanyModel.collectionName)
      .doc(_companyId)
      .collection(AccountingAccountModel.collectionName);
}

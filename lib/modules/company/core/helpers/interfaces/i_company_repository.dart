import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class ICompanyRepository {
  String get generateId;
  Future<CompanyModel?> get(String id);
  Future<void> create(CompanyModel company, {Transaction? txn});
}

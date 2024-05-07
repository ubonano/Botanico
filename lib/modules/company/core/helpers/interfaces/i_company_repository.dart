import 'package:botanico/modules/company/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ICompanyRepository {
  String get generateId;
  Future<CompanyModel?> get(String id);
  Future<void> create(CompanyModel company, {Transaction? txn});
}

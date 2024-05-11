import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class ICompanyBusinessLogic {
  CompanyModel? get currentCompany$;
  String get currentCompanyId;

  Future<void> createCompany(CompanyModel company, Transaction? txn);
  Future<void> postCreateCompany();
  Future<CompanyModel?> get(String id);
  Future<CompanyModel?> fetchLoggedCompany();
  void clearCurrentCompany();
}

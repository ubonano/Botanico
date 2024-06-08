import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class ICompanyBusinessLogic {
  CompanyModel? get currentCompany$;

  Future<void> createCompany(CompanyModel company, Transaction? txn);
  Future<CompanyModel?> get(String id);
  Future<CompanyModel?> fetchLoggedCompany();
  void clearCurrentCompany();
}

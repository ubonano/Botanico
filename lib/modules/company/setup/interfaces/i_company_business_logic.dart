import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/company_model.dart';
export '../model/company_model.dart';

abstract class ICompanyBusinessLogic {
  CompanyModel? get currentCompany$;

  Future<CompanyModel?> get(String id);
  Future<void> create(CompanyModel company, {Transaction? txn});
  Future<void> update(CompanyModel company, {Transaction? txn});
  Future<CompanyModel?> fetchLoggedCompany();
  void clearCurrentCompany();
}

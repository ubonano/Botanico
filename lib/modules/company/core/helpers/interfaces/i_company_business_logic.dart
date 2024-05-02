import 'package:botanico/modules/company/company_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ICompanyBusinessLogic {
  CompanyModel? get currentCompany$;

  Future<void> createCompany(CompanyModel company, Transaction? txn);
  Future<void> postCreateCompany();
  Future<CompanyModel?> get(String id);
  Future<CompanyModel?> fetch(String id);
  void clearCurrentCompany();
}

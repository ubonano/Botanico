import '../model/company_model.dart';
export '../model/company_model.dart';

abstract class ICompanyService {
  CompanyModel? get currentCompany$;

  Future<CompanyModel?> get(String id);
  Future<void> create(CompanyModel company);
  Future<void> update(CompanyModel company);
  Future<CompanyModel?> fetchCurrentCompany();
  void clearCurrentCompany();
}

import '../../model/company_model.dart';
export '../../model/company_model.dart';

abstract class ICompanyService {
  CompanyModel? get loggedCompany$;

  Future<CompanyModel?> get(String id);
  Future<void> create(CompanyModel company);
  Future<void> update(CompanyModel company);
  Future<CompanyModel?> fetchLoggedCompany();
  void clearCurrentCompany();
}

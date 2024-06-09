import '../../../module.dart';

abstract class ICompanyService {
  CompanyModel? get loggedCompany$;
  Future<void> createCompany(CompanyModel company);
  Future<CompanyModel?> fetchLoggedCompany();
  void clearCurrentCompany();
}

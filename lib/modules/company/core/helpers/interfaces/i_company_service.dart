import '../../../module.dart';

abstract class ICompanyService {
  Future<void> createCompany(CompanyModel company);
  Future<void> fetchLoggedCompany();
}

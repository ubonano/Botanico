import 'package:botanico/modules/company/company_module.dart';

abstract class ICompanyService {
  Future<void> createCompany(CompanyModel company);
}

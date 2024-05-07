import 'package:botanico/modules/company/module.dart';

abstract class ICompanyService {
  Future<void> createCompany(CompanyModel company);
}

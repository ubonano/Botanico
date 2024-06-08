import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class CompanyService extends GetxService with GlobalHelper implements ICompanyService {
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  @override
  CompanyModel? get loggedCompany$ => _companyBusinessLogic.currentCompany$;

  @override
  Future<void> createCompany(CompanyModel company) async => await operation.perform(
        operationName: 'Create company ${company.uid}',
        inTransaction: true,
        operation: (txn) async => await _companyBusinessLogic.createCompany(company, txn),
      );

  @override
  Future<CompanyModel?> fetchLoggedCompany() async => _companyBusinessLogic.fetchLoggedCompany();

  @override
  void clearCurrentCompany() => _companyBusinessLogic.clearCurrentCompany();
}

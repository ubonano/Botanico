import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class CompanyService extends GetxService with GlobalHelper implements ICompanyService {
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  @override
  Future<void> createCompany(CompanyModel company) async {
    await operation.perform(
      operationName: 'Create company',
      inTransaction: true,
      operation: (txn) async => await _companyBusinessLogic.createCompany(company, txn),
      onSuccess: _companyBusinessLogic.postCreateCompany,
    );
  }

  @override
  Future<void> fetchLoggedCompany() async => _companyBusinessLogic.fetchLoggedCompany();
}

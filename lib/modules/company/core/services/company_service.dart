import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class CompanyService with GlobalServices {
  late final CompanyHandler _companyHandler = Get.find();

  Future<void> createCompany(CompanyModel company) async {
    await oprManager.perform(
      operationName: 'Create company',
      inTransaction: true,
      operation: (txn) async => await _companyHandler.createCompany(company, txn),
      onSuccess: _companyHandler.postCreateCompany,
    );
  }
}

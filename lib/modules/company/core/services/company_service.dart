import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class CompanyService extends GetxService with GlobalServices implements ICompanyService {
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  @override
  Future<void> createCompany(CompanyModel company) async {
    await oprManager.perform(
      operationName: 'Create company',
      inTransaction: true,
      operation: (txn) async => await _companyBusinessLogic.createCompany(company, txn),
      onSuccess: _companyBusinessLogic.postCreateCompany,
    );
  }
}

import 'package:get/get.dart';

import '../helpers/global_helper.dart';
import '../setup/interfaces/i_company_business_logic.dart';
import '../setup/interfaces/i_company_service.dart';
import '../setup/permissions.dart';

class CompanyService extends GetxService with GlobalHelper implements ICompanyService {
  late final CompanyPermissions _module = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  @override
  CompanyModel? get loggedCompany$ => _companyBusinessLogic.currentCompany$;

  @override
  Future<CompanyModel?> get(String id) async => await operation.perform(
        operationName: 'Get company $id',
        operation: (_) async => await _companyBusinessLogic.get(id),
      );

  @override
  Future<void> create(CompanyModel company) async => await operation.perform(
        operationName: 'Create company ${company.uid}',
        inTransaction: true,
        operation: (txn) async => await _companyBusinessLogic.create(company, txn: txn),
      );

  @override
  Future<void> update(CompanyModel company) async => await operation.perform(
        operationName: 'Update company ${company.uid}',
        permissionKey: _module.updateKey,
        inTransaction: true,
        operation: (txn) async => await _companyBusinessLogic.update(company, txn: txn),
      );

  @override
  Future<CompanyModel?> fetchLoggedCompany() async => _companyBusinessLogic.fetchLoggedCompany();

  @override
  void clearCurrentCompany() => _companyBusinessLogic.clearCurrentCompany();
}

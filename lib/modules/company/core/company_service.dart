import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

class CompanyService extends GetxService with GlobalHelper implements ICompanyService {
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
        permissionKey: CompanyModule.updateKey,
        inTransaction: true,
        operation: (txn) async => await _companyBusinessLogic.update(company, txn: txn),
      );

  @override
  Future<CompanyModel?> fetchLoggedCompany() async => _companyBusinessLogic.fetchLoggedCompany();

  @override
  void clearCurrentCompany() => _companyBusinessLogic.clearCurrentCompany();
}

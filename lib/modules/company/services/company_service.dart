import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../module.dart';

class CompanyService extends GetxService {
  late final AuthService _auth = Get.find();
  late final OperationManagerService _operationManager = Get.find();
  late final CompanyRepository _companyRepository = Get.find();

  String get _generateId => _companyRepository.generateId;

  Future<CompanyModel?> get(String id) async {
    CompanyModel? company;

    await _operationManager.perform(
      operationName: 'Get company: $id',
      operation: (_) async {
        company = await _companyRepository.get(id);
      },
    );

    return company;
  }

  Future<void> create({
    required CompanyModel company,
    required Function() onSuccess,
  }) async {
    await _operationManager.perform(
      operationName: 'Create company',
      operation: (_) async => await _companyRepository.create(company.copyWith(uid: _generateId)),
      onSuccess: () async {
        await _auth.fetchWorker();
        onSuccess();
      },
    );
  }
}

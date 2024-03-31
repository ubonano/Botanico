import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../module.dart';

class CompanyCreateController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'CompanyCreateController';

  late final CompanyService _companyService = Get.find();

  @override
  List<String> formFields = ['name', 'address', 'city', 'province', 'country', 'phone'];

  @override
  Future<void> submit() async {
    await operationManager.perform(
      operationName: 'Create company',
      successMessage: 'Empresa creada',
      inTransaction: true,
      operation: (txn) async => await _companyService.create(_newCompany, txn: txn),
      onSuccess: () async {
        await session.fetchWorker();
        navigate.toHome();
      },
    );
  }

  CompanyModel get _newCompany => CompanyModel(
        name: getFieldValue('name'),
        address: getFieldValue('address'),
        city: getFieldValue('city'),
        province: getFieldValue('province'),
        country: getFieldValue('country'),
        phone: getFieldValue('phone'),
      );
}

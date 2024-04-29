import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

import '../../company_module.dart';

class CompanyCreateController extends GetxController with FormController, LifeCycleLogging {
  @override
  String get logTag => 'CompanyCreateController';

  late final CompanyService _companyService = Get.find();

  @override
  List<String> formFields = [
    FieldKeys.name,
    FieldKeys.address,
    FieldKeys.city,
    FieldKeys.province,
    FieldKeys.country,
    FieldKeys.phone,
  ];

  @override
  Future<void> submit() async => await _companyService.createCompany(_company);

  CompanyModel get _company => CompanyModel(
        name: getFieldValue(FieldKeys.name),
        address: getFieldValue(FieldKeys.address),
        city: getFieldValue(FieldKeys.city),
        province: getFieldValue(FieldKeys.province),
        country: getFieldValue(FieldKeys.country),
        phone: getFieldValue(FieldKeys.phone),
      );
}

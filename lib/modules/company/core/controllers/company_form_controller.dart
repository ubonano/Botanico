import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class CompanyFormController extends GetxController with FormHelper<CompanyModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'CompanyFormController';

  late final ICompanyService _companyService = Get.find();

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
  Future<void> submit() async => await _companyService.createCompany(buildModel());

  @override
  CompanyModel buildModel() => CompanyModel(
        name: getFieldValue(FieldKeys.name),
        address: getFieldValue(FieldKeys.address),
        city: getFieldValue(FieldKeys.city),
        province: getFieldValue(FieldKeys.province),
        country: getFieldValue(FieldKeys.country),
        phone: getFieldValue(FieldKeys.phone),
      );
}

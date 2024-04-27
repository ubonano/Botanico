import 'package:botanico/modules/company/company_module.dart';
import 'package:get/get.dart';

mixin CompanyContext {
  late final CompanyRepository companyRepo = Get.find();
}

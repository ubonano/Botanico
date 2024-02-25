import 'package:botanico/modules/foundation/utils/log_lifecycle_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'company_profile_model.dart';
import 'company_profile_service.dart';
import '../foundation/utils/common_services.dart';

class CompanyProfileController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'CompanyProfileController';

  final CompanyProfileService _companyService = Get.find();

  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController provinceController;
  late TextEditingController countryController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    provinceController = TextEditingController();
    countryController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    provinceController.dispose();
    countryController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  Future<void> createCompany() async {
    final company = CompanyProfileModel(
      ownerUid: authService.currentUser!.uid,
      name: nameController.text.trim(),
      address: addressController.text.trim(),
      city: cityController.text.trim(),
      province: provinceController.text.trim(),
      country: countryController.text.trim(),
      phone: phoneController.text.trim(),
    );

    await _companyService.createCompanyProfile(company);
  }
}

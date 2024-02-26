import 'package:botanico/modules/foundation/utils/log_lifecycle.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'company_profile_model.dart';
import '../foundation/services/common_services.dart';

class CompanyProfileController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'CompanyProfileController';

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();

  String get _name => nameController.text.trim();
  String get _address => addressController.text.trim();
  String get _city => cityController.text.trim();
  String get _province => provinceController.text.trim();
  String get _country => countryController.text.trim();
  String get _phone => phoneController.text.trim();

  CompanyProfileModel get newCompanyProfile => CompanyProfileModel(
        ownerUid: authService.currentUser!.uid,
        name: _name,
        address: _address,
        city: _city,
        province: _province,
        country: _country,
        phone: _phone,
      );

  Future<void> setCompany() async {
    await asyncOperationService.performOperation(
      operation: () async {
        final company = await companyProfileService.getCompanyProfileByOwner(authService.currentUser!.uid);

        if (company != null) {
          await companyProfileService.updateCompanyProfile(newCompanyProfile.copyWith(uid: company.uid));
        } else {
          await companyProfileService.createCompanyProfile(newCompanyProfile);
        }
      },
      operationName: 'Create company profile',
      successMessage: 'Empresa creada con exito!',
    );

    navigationService.toHome();
  }

  Future<void> initializeControllers() async {
    if (companyProfileService.isCompanyProfile) {
      setControllers(companyProfileService.currentCompanyProfile!);
    } else {
      clearControllers();
    }
  }

  void setControllers(CompanyProfileModel companyProfile) {
    nameController.text = companyProfile.name;
    addressController.text = companyProfile.address;
    cityController.text = companyProfile.city;
    provinceController.text = companyProfile.province;
    countryController.text = companyProfile.country;
    phoneController.text = companyProfile.phone;
  }

  void clearControllers() {
    nameController.clear();
    addressController.clear();
    cityController.clear();
    provinceController.clear();
    countryController.clear();
    phoneController.clear();
  }

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  void disposeControllers() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    provinceController.dispose();
    countryController.dispose();
    phoneController.dispose();
  }
}

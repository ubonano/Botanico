import 'package:botanico/modules/foundation/utils/custom_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'company_profile_model.dart';

class CompanyProfileController extends GetxController with CustomController {
  @override
  String get logTag => 'CompanyProfileController';

  final companyFormKey = GlobalKey<FormState>();

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

  Future<void> submit() async {
    // TODO analizar de separar para actualizar en otro lado
    if (!companyFormKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Create company',
      successMessage: 'Empresa creada con exito!',
      operation: () async {
        await companyProfileService.set(
          CompanyProfileModel(
            ownerUid: loggedUserUID,
            name: _name,
            address: _address,
            city: _city,
            province: _province,
            country: _country,
            phone: _phone,
          ),
        );

        await userProfileService.setCompanyUid(loggedUserUID, company!.uid);
        await fetchUserProfile();

        await fetchCompany();
      },
      onSuccess: navigate.toHome,
    );
  }

  Future<void> initializeControllers() async {
    if (isCompanyLoaded) {
      setControllers(company!);
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

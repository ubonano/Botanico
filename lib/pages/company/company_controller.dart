import 'package:botanico/utils/custom_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/company_model.dart';

class CompanyController extends GetxController with CustomController {
  @override
  String get logTag => 'CompanyController';

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
    if (!companyFormKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Create company',
      successMessage: 'Empresa creada con exito!',
      operation: () async {
        await companyService.set(
          CompanyModel(
            ownerUid: loggedUserUID,
            name: _name,
            address: _address,
            city: _city,
            province: _province,
            country: _country,
            phone: _phone,
          ),
        );

        await fetchCompany();
      },
      onSuccess: () => navigate.toHome(),
    );
  }

  Future<void> initializeControllers() async {
    if (isCompanyLoaded) {
      setControllers(company!);
    } else {
      clearControllers();
    }
  }

  void setControllers(CompanyModel company) {
    nameController.text = company.name;
    addressController.text = company.address;
    cityController.text = company.city;
    provinceController.text = company.province;
    countryController.text = company.country;
    phoneController.text = company.phone;
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

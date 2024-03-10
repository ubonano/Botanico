import 'package:botanico/utils/custom_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/company_model.dart';

class CompanyCreateController extends GetxController with CustomController {
  @override
  String get logTag => 'CompanyCreateController';

  final formKey = GlobalKey<FormState>();

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
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Create company',
      successMessage: 'Empresa creada!',
      operation: () async {
        await companyService.create(
          CompanyModel(
            ownerUid: loggedUserUID,
            name: _name,
            address: _address,
            city: _city,
            province: _province,
            country: _country,
            phone: _phone,
          ),
        ); // REfactoriza para que devuelva la empresa con el ID, o el ID inclusive (fijate de que tambien le agregue el UID a la empresa antes de insertarla). Hacer lo mismo con profiel talves

        await fetchCompany();
      },
      onSuccess: navigate.toHome,
    );
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

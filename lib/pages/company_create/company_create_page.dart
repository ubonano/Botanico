import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/input_fields/address_input_field.dart';
import '../../widgets/input_fields/city_input_field.dart';
import '../../widgets/input_fields/country_input_field.dart';
import '../../widgets/input_fields/name_input_field.dart';
import '../../widgets/input_fields/province_input_field.dart';
import '../../widgets/input_fields/phone_input_field.dart';
import 'company_create_controller.dart';

class CompanyCreatePage extends GetView<CompanyCreateController> {
  const CompanyCreatePage({super.key});

  void submit() => controller.submit();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Crear Compañía',
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              NameInputField(controller: controller.nameCtrl),
              AddressInputField(controller: controller.addressCtrl),
              CityInputField(controller: controller.cityCtrl),
              ProvinceInputField(controller: controller.provinceCtrl),
              CountryInputField(controller: controller.countryCtrl),
              PhoneInputField(controller: controller.phoneCtrl),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: submit, child: const Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }
}

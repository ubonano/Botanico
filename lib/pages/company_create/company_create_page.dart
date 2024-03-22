import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/buttons/custom_button.dart';
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

  get _formKey => controller.formKey;
  get _labelButton => 'Guardar empresa';

  void _createCompany() => controller.createCompany();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Crear Compañía',
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              NameInputField(controller: controller.getFieldController('name')!),
              AddressInputField(controller: controller.getFieldController('address')!),
              CityInputField(controller: controller.getFieldController('city')!),
              ProvinceInputField(controller: controller.getFieldController('province')!),
              CountryInputField(controller: controller.getFieldController('country')!),
              PhoneInputField(controller: controller.getFieldController('phone')!),
              CustomButton(text: _labelButton, onPressed: _createCompany),
            ],
          ),
        ),
      ),
    );
  }
}

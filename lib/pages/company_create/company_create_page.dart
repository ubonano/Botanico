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

  get _formKey => controller.formKey;

  get _nameCtrl => controller.textCtrls[0];
  get _addressCtrl => controller.textCtrls[1];
  get _cityCtrl => controller.textCtrls[2];
  get _provinceCtrl => controller.textCtrls[3];
  get _contryCtrl => controller.textCtrls[4];
  get _phoneCtrl => controller.textCtrls[5];

  void _submit() => controller.submit();

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
              NameInputField(controller: _nameCtrl),
              AddressInputField(controller: _addressCtrl),
              CityInputField(controller: _cityCtrl),
              ProvinceInputField(controller: _provinceCtrl),
              CountryInputField(controller: _contryCtrl),
              PhoneInputField(controller: _phoneCtrl),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: const Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }
}

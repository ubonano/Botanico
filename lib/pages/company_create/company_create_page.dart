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
  get _textCtrls => controller.textCtrls;

  get _nameCtrl => _textCtrls[0];
  get _addressCtrl => _textCtrls[1];
  get _cityCtrl => _textCtrls[2];
  get _provinceCtrl => _textCtrls[3];
  get _countryCtrl => _textCtrls[4];
  get _phoneCtrl => _textCtrls[5];

  void _submit() => controller.createCompany();

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
              NameInputField(controller: _nameCtrl, onFieldSubmitted: _submit),
              AddressInputField(controller: _addressCtrl, onFieldSubmitted: _submit),
              CityInputField(controller: _cityCtrl, onFieldSubmitted: _submit),
              ProvinceInputField(controller: _provinceCtrl, onFieldSubmitted: _submit),
              CountryInputField(controller: _countryCtrl, onFieldSubmitted: _submit),
              PhoneInputField(controller: _phoneCtrl, onFieldSubmitted: _submit),
              CustomButton(text: 'Guardar empresa', onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}

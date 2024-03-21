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

  get _nameCtrl => _getTextController('name');
  get _addressCtrl => _getTextController('address');
  get _cityCtrl => _getTextController('city');
  get _provinceCtrl => _getTextController('province');
  get _countryCtrl => _getTextController('country');
  get _phoneCtrl => _getTextController('phone');

  get _labelButton => 'Guardar empresa';

  TextEditingController? _getTextController(String field) => controller.getFieldController(field);

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
              NameInputField(controller: _nameCtrl),
              AddressInputField(controller: _addressCtrl),
              CityInputField(controller: _cityCtrl),
              ProvinceInputField(controller: _provinceCtrl),
              CountryInputField(controller: _countryCtrl),
              PhoneInputField(controller: _phoneCtrl),
              CustomButton(text: _labelButton, onPressed: _createCompany),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../module.dart';

class CompanyCreatePage extends GetView<CompanyCreateController> {
  const CompanyCreatePage({super.key});

  get _title => 'Crear empresa';
  get _labelButton => 'Guardar empresa';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              NameInputField(controller: controller.getFieldController('name')!),
              AddressInputField(controller: controller.getFieldController('address')!),
              CityInputField(controller: controller.getFieldController('city')!),
              ProvinceInputField(controller: controller.getFieldController('province')!),
              CountryInputField(controller: controller.getFieldController('country')!),
              PhoneInputField(controller: controller.getFieldController('phone')!),
              CustomButton(text: _labelButton, onPressed: createCompany),
            ],
          ),
        ),
      ),
    );
  }

  createCompany() {
    if (controller.validateForm()) controller.createCompany();
  }
}

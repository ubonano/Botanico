import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../module.dart';

class CompanyCreatePage extends GetView<CompanyCreateController> {
  const CompanyCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Crear empresa',
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
              CustomButton(text: 'Guardar empresa', onPressed: controller.secureSubmit),
            ],
          ),
        ),
      ),
    );
  }
}

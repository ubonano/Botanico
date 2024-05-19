import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class CompanyFormPage extends GetView<CompanyFormController> {
  const CompanyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('CompanyFormPage'),
      title: controller.isUpdateMode ? 'Empresa' : 'Crear empresa',
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              NameInputField(controller),
              AddressInputField(controller),
              CityInputField(controller),
              ProvinceInputField(controller),
              CountryInputField(controller),
              PhoneInputField(controller),
              const CompanySaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

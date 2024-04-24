import 'package:botanico/modules/company/ui/widgets/save_company_button.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../company_module.dart';

class CompanyCreatePage extends GetView<CompanyCreateController> {
  const CompanyCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('CompanyCreatePage'),
      title: 'Crear empresa',
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
              const SaveCompanyButton(),
            ],
          ),
        ),
      ),
    );
  }
}

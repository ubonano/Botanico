import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/company_profile_controller.dart';
import '../widgets/custom_input_field.dart';

class CompanyProfilePage extends GetView<CompanyProfileController> {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Compañía')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              CustomInputField(label: 'Nombre', controller: controller.nameController),
              CustomInputField(label: 'Dirección', controller: controller.addressController),
              CustomInputField(label: 'Localidad', controller: controller.cityController),
              CustomInputField(label: 'Provincia', controller: controller.provinceController),
              CustomInputField(label: 'País', controller: controller.countryController),
              CustomInputField(label: 'Teléfono', controller: controller.phoneController),
              ElevatedButton(onPressed: controller.createCompany, child: const Text('Crear Compañía')),
            ],
          ),
        ),
      ),
    );
  }
}

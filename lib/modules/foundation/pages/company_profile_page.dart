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
              const SizedBox(height: 10),
              CustomInputField(label: 'Dirección', controller: controller.addressController),
              const SizedBox(height: 10),
              CustomInputField(label: 'Localidad', controller: controller.cityController),
              const SizedBox(height: 10),
              CustomInputField(label: 'Provincia', controller: controller.provinceController),
              const SizedBox(height: 10),
              CustomInputField(label: 'País', controller: controller.countryController),
              const SizedBox(height: 10),
              CustomInputField(label: 'Teléfono', controller: controller.phoneController),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: controller.createCompany, child: const Text('Crear Compañía')),
            ],
          ),
        ),
      ),
    );
  }
}

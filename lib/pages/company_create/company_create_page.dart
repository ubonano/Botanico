import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/validator.dart';
import 'company_create_controller.dart';
import '../../widgets/custom_input_field.dart';

class CompanyCreatePage extends GetView<CompanyCreateController> {
  const CompanyCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Compañía')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomInputField(
                label: 'Nombre',
                controller: controller.nameController,
                validator: (value) => Validator.required(value, fieldName: "El nombre"),
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Dirección',
                controller: controller.addressController,
                validator: (value) => Validator.required(value, fieldName: "La dirección"),
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Localidad',
                controller: controller.cityController,
                validator: (value) => Validator.required(value, fieldName: "La localidad"),
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Provincia',
                controller: controller.provinceController,
                validator: (value) => Validator.required(value, fieldName: "La provincia"),
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'País',
                controller: controller.countryController,
                validator: (value) => Validator.required(value, fieldName: "El país"),
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Teléfono',
                controller: controller.phoneController,
                validator: Validator.phoneNumber,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: controller.submit, child: const Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }
}

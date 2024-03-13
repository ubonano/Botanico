import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/validator.dart';
import '../../widgets/input_fields/custom_input_field.dart';
import 'worker_create_controller.dart';

class WorkerCreatePage extends GetView<WorkerCreateController> {
  const WorkerCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completa tu Perfil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomInputField(
                label: "Nombre Completo",
                controller: controller.nameController,
                validator: (value) => Validator.required(value, fieldName: 'El nombre'),
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "Fecha de Nacimiento",
                controller: controller.birthDateController,
                keyboardType: TextInputType.datetime,
                validator: Validator.birthDate,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "Número de Teléfono",
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                validator: Validator.phoneNumber,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "DNI",
                controller: controller.dniController,
                keyboardType: TextInputType.number,
                validator: Validator.dni,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.submit,
                child: const Text('Guardar Perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../foundation/utils/validator.dart';
import '../../../foundation/widgets/custom_input_field.dart';
import 'user_create_controller.dart';

class UserCreatePage extends GetView<UserCreateController> {
  const UserCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completa tu Perfil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.userFormKey,
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

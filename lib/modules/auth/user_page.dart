import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../foundation/utils/validator.dart';
import '../foundation/widgets/custom_input_field.dart';
import 'user_controller.dart';

class UserPage extends GetView<UserController> {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.initializeControllers();

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
                validator: (value) => value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "Fecha de Nacimiento",
                controller: controller.birthDateController,
                keyboardType: TextInputType.datetime,
                validator: Validator.birthDateValidator,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "Número de Teléfono",
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                validator: Validator.phoneNumberValidator,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "DNI",
                controller: controller.dniController,
                keyboardType: TextInputType.number,
                validator: Validator.dniValidator,
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

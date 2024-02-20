import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/validator.dart';
import '../../widgets/custom_input_field.dart';
import '../controllers/user_profile_controller.dart';

class UserProfilePage extends GetView<UserProfileController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.initializeFormFields();

    return Scaffold(
      appBar: AppBar(title: const Text('Completa tu Perfil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInputField(
                label: "Nombre Completo",
                controller: controller.nameController,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await controller.createUserProfile();
                  }
                },
                child: const Text('Guardar Perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

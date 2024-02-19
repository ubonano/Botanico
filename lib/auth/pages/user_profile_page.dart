import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_input_field.dart';
import '../controllers/user_profile_controller.dart';

class UserProfilePage extends GetView<UserProfileController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.initializeFormFieldsWithUserProfile();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Completa tu Perfil'),
        automaticallyImplyLeading: false,
      ),
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
                controller: controller.dobController,
                keyboardType: TextInputType.datetime,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "Número de Teléfono",
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "DNI",
                controller: controller.dniController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.createUserProfile();
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

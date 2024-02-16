import 'package:botanico/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../../widgets/custom_input_field.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileFormPage extends StatefulWidget {
  const UserProfileFormPage({Key? key}) : super(key: key);

  @override
  State<UserProfileFormPage> createState() => _UserProfileFormPageState();
}

class _UserProfileFormPageState extends State<UserProfileFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController authController = Get.find();
  final UserProfileController userProfileController = Get.find();
  final NavigationService navigationService = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dniController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                controller: nameController,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "Fecha de Nacimiento",
                controller: dobController,
                keyboardType: TextInputType.datetime,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "Número de Teléfono",
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: "DNI",
                controller: dniController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Este campo es obligatorio" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await userProfileController.createUserProfile(
                      name: nameController.text,
                      dob: dobController.text,
                      phone: phoneController.text,
                      dni: dniController.text,
                    );

                    navigationService.navigateToHome();
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

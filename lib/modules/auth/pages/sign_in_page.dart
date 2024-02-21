import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../foundation/utils/validator.dart';
import '../../foundation/widgets/custom_input_field.dart';
import '../controllers/sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validator.emailValidator,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Contraseña',
                controller: controller.passwordController,
                obscureText: true,
                validator: Validator.passwordValidator,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.signIn();
                  }
                },
                child: const Text('Iniciar Sesión'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: controller.navigateToSignUp,
                child: const Text('¿No tenes cuenta? Crear nueva cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

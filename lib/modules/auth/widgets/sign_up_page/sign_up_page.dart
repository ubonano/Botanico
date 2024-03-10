import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/validator.dart';
import '../../../../widgets/custom_input_field.dart';
import 'sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.signUpformKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validator.email,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Contraseña',
                controller: controller.passwordController,
                obscureText: true,
                validator: Validator.password,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Confirmar Contraseña',
                controller: controller.confirmPasswordController,
                obscureText: true,
                validator: (value) => Validator.confirmPasswordValidator(value, controller.passwordController.text),
                textInputAction: TextInputAction.go,
                onFieldSubmitted: (_) => controller.signUp(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: controller.signUp, child: const Text('Registrar')),
              const SizedBox(height: 20),
              TextButton(onPressed: controller.navigateToSignIn, child: const Text('¿Ya tenes cuenta? Inicia sesión')),
            ],
          ),
        ),
      ),
    );
  }
}

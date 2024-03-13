import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/input_fields/confirm_password_input_field.dart';
import '../../widgets/input_fields/email_input_field.dart';
import '../../widgets/input_fields/password_input_field.dart';
import 'sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  void signUp() => controller.signUp();
  void toSignIn() => controller.navigateToSignIn();

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
              EmailInputField(
                controller: controller.emailCtrl,
                onFieldSubmitted: signUp,
              ),
              PasswordInputField(
                controller: controller.passwordCtrl,
                onFieldSubmitted: signUp,
              ),
              ConfirmPasswordInputField(
                controller: controller.confirmPasswordCtrl,
                passwordController: controller.passwordCtrl,
                onFieldSubmitted: signUp,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: signUp, child: const Text('Registrar')),
              const SizedBox(height: 20),
              TextButton(onPressed: toSignIn, child: const Text('¿Ya tenes cuenta? Inicia sesión')),
            ],
          ),
        ),
      ),
    );
  }
}

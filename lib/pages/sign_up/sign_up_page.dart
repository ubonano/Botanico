import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/input_fields/confirm_password_input_field.dart';
import '../../widgets/input_fields/email_input_field.dart';
import '../../widgets/input_fields/password_input_field.dart';
import 'sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  get _formKey => controller.signUpformKey;

  get _emailCtrl => controller.textCtrls[0];
  get _passwordCtrl => controller.textCtrls[1];
  get _confirmPasswordCtrl => controller.textCtrls[2];

  void _signUp() => controller.signUp();
  void _toSignIn() => controller.navigateToSignIn();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Registro',
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller: _emailCtrl, onFieldSubmitted: _signUp),
              PasswordInputField(controller: _passwordCtrl, onFieldSubmitted: _signUp),
              ConfirmPasswordInputField(
                controller: _confirmPasswordCtrl,
                passwordController: _passwordCtrl,
                onFieldSubmitted: _signUp,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _signUp, child: const Text('Registrar')),
              const SizedBox(height: 20),
              TextButton(onPressed: _toSignIn, child: const Text('¿Ya tenes cuenta? Inicia sesión')),
            ],
          ),
        ),
      ),
    );
  }
}

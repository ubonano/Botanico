import 'package:botanico/pages/recover_password/recover_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/input_fields/email_input_field.dart';
import '../../widgets/input_fields/password_input_field.dart';
import 'sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  get _formKey => controller.formKey;

  get _emailCtrl => controller.textCtrls[0];
  get _passwordCtrl => controller.textCtrls[1];

  void _signIn() => controller.submit();
  void _toSignUp() => controller.navigateToSignUp();
  void _showRecoverPasswordDialog() => Get.dialog(const RecoverPasswordDialog());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Iniciar Sesión',
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller: _emailCtrl, onFieldSubmitted: _signIn),
              PasswordInputField(controller: _passwordCtrl, onFieldSubmitted: _signIn),
              ElevatedButton(onPressed: _signIn, child: const Text('Iniciar Sesión')),
              const SizedBox(height: 20),
              TextButton(onPressed: _showRecoverPasswordDialog, child: const Text("¿Olvidaste tu contraseña?")),
              const SizedBox(height: 20),
              TextButton(onPressed: _toSignUp, child: const Text('¿No tenes cuenta? Crear nueva cuenta')),
            ],
          ),
        ),
      ),
    );
  }
}

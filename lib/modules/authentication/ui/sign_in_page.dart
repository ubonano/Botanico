import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../module.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  get _title => 'Iniciar Sesión';
  get _signInButtonText => 'Iniciar Sesión';
  get _forgotPasswordButtonText => '¿Olvidaste tu contraseña';
  get _toSignUpButtonText => '¿No tenes cuenta? Crear nueva cuenta';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller: controller.getFieldController('email')!),
              PasswordInputField(
                controller: controller.getFieldController('password')!,
                onFieldSubmitted: controller.secureSubmit,
              ),
              CustomButton(text: _signInButtonText, onPressed: controller.secureSubmit),
              CustomTextButton(
                text: _forgotPasswordButtonText,
                onPressed: () => Get.dialog(
                  const RecoverPasswordDialog(),
                ),
              ),
              CustomTextButton(text: _toSignUpButtonText, onPressed: controller.navigate.toSignUp),
            ],
          ),
        ),
      ),
    );
  }
}

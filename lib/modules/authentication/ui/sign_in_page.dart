import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../module.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Iniciar Sesión',
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
              CustomButton(text: 'Iniciar Sesión', onPressed: controller.secureSubmit),
              CustomTextButton(
                text: '¿Olvidaste tu contraseña',
                onPressed: () => Get.dialog(
                  const RecoverPasswordDialog(),
                ),
              ),
              CustomTextButton(text: '¿No tenes cuenta? Crear nueva cuenta', onPressed: controller.navigate.toSignUp),
            ],
          ),
        ),
      ),
    );
  }
}

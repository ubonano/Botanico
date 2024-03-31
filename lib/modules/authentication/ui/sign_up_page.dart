import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../module.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Registro',
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller: controller.getFieldController('email')!),
              PasswordInputField(controller: controller.getFieldController('password')!),
              ConfirmPasswordInputField(
                controller: controller.getFieldController('passwordConfirm')!,
                passwordController: controller.getFieldController('password')!,
                onFieldSubmitted: controller.secureSubmit,
              ),
              CustomButton(text: 'Registrar', onPressed: controller.secureSubmit),
              CustomTextButton(text: '¿Ya tenes cuenta? Inicia sesión', onPressed: controller.navigate.toSignIn),
            ],
          ),
        ),
      ),
    );
  }
}

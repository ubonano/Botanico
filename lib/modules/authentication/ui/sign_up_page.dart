import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  get _title => 'Registro';
  get _signUpButtonText => 'Registrar';
  get _toSignInButtonText => '¿Ya tenes cuenta? Inicia sesión';

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
              PasswordInputField(controller: controller.getFieldController('password')!),
              ConfirmPasswordInputField(
                controller: controller.getFieldController('passwordConfirm')!,
                passwordController: controller.getFieldController('password')!,
                onFieldSubmitted: controller.secureSubmit,
              ),
              CustomButton(text: _signUpButtonText, onPressed: controller.secureSubmit),
              CustomTextButton(text: _toSignInButtonText, onPressed: controller.navigate.toSignIn),
            ],
          ),
        ),
      ),
    );
  }
}

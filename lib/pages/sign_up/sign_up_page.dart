import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/navigation_service.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/buttons/custom_text_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/input_fields/confirm_password_input_field.dart';
import '../../widgets/input_fields/email_input_field.dart';
import '../../widgets/input_fields/password_input_field.dart';
import 'sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  get _title => 'Registro';
  get _signUpButtonText => 'Registrar';
  get _toSignInButtonText => '¿Ya tenes cuenta? Inicia sesión';

  NavigationService get _navigate => Get.find<NavigationService>();

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
                onFieldSubmitted: controller.signUp,
              ),
              ConfirmPasswordInputField(
                controller: controller.getFieldController('passwordConfirm')!,
                passwordController: controller.getFieldController('password')!,
                onFieldSubmitted: controller.signUp,
              ),
              CustomButton(text: _signUpButtonText, onPressed: controller.signUp),
              CustomTextButton(text: _toSignInButtonText, onPressed: _navigate.toSignIn),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:botanico/pages/recover_password/recover_password_dialog.dart';
import 'package:botanico/widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/navigation_service.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/input_fields/email_input_field.dart';
import '../../widgets/input_fields/password_input_field.dart';
import 'sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  get _title => 'Iniciar Sesión';
  get _signInButtonText => 'Iniciar Sesión';
  get _forgotPasswordButtonText => '¿Olvidaste tu contraseña';
  get _toSignUpButtonText => '¿No tenes cuenta? Crear nueva cuenta';

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
                  controller: controller.getFieldController('password')!, onFieldSubmitted: controller.signIn),
              CustomButton(text: _signInButtonText, onPressed: controller.signIn),
              CustomTextButton(
                text: _forgotPasswordButtonText,
                onPressed: () => Get.dialog(const RecoverPasswordDialog()),
              ),
              CustomTextButton(text: _toSignUpButtonText, onPressed: _navigate.toSignUp),
            ],
          ),
        ),
      ),
    );
  }
}

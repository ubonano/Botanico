import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/buttons/custom_text_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/input_fields/confirm_password_input_field.dart';
import '../../widgets/input_fields/email_input_field.dart';
import '../../widgets/input_fields/password_input_field.dart';
import 'sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  get _formKey => controller.formKey;

  get _title => 'Registro';

  get _emailCtrl => controller.getFieldController('email');
  get _passwordCtrl => controller.getFieldController('password');
  get _confirmPasswordCtrl => controller.getFieldController('passwordConfirm');

  get _signUpButtonText => 'Registrar';
  get _toSignInButtonText => '¿Ya tenes cuenta? Inicia sesión';

  void _signUp() => controller.signUp();
  void _toSignIn() => controller.navigate.toSignIn();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller: _emailCtrl),
              PasswordInputField(controller: _passwordCtrl, onFieldSubmitted: _signUp),
              ConfirmPasswordInputField(
                controller: _confirmPasswordCtrl,
                passwordController: _passwordCtrl,
                onFieldSubmitted: _signUp,
              ),
              CustomButton(text: _signUpButtonText, onPressed: _signUp),
              CustomTextButton(text: _toSignInButtonText, onPressed: _toSignIn),
            ],
          ),
        ),
      ),
    );
  }
}

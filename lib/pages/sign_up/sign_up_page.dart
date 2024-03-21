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

  get _formKey => controller.signUpformKey;
  get _textCtrls => controller.textCtrls;

  get _emailCtrl => _textCtrls[0];
  get _passwordCtrl => _textCtrls[1];
  get _confirmPasswordCtrl => _textCtrls[2];

  void _submit() => controller.signUp();
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
              EmailInputField(controller: _emailCtrl, onFieldSubmitted: _submit),
              PasswordInputField(controller: _passwordCtrl, onFieldSubmitted: _submit),
              ConfirmPasswordInputField(
                controller: _confirmPasswordCtrl,
                passwordController: _passwordCtrl,
                onFieldSubmitted: _submit,
              ),
              CustomButton(text: 'Registrar', onPressed: _submit),
              CustomTextButton(text: '¿Ya tenes cuenta? Inicia sesión', onPressed: _toSignIn),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/custom_scaffold.dart';
import '../ui.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('SignUpPage'),
      title: 'Registro',
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller),
              PasswordInputField(controller),
              ConfirmPasswordInputField(controller, onFieldSubmitted: controller.secureSubmit),
              const SignUpButton(),
              SignInNavigateButton(),
            ],
          ),
        ),
      ),
    );
  }
}

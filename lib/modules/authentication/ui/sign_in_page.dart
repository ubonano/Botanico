import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('SignInPage'),
      title: 'Iniciar Sesión',
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller),
              PasswordInputField(controller, onFieldSubmitted: controller.secureSubmit),
              const SignInButton(),
              const SignInRecoverButton(),
              SignUpNavigateButton(),
            ],
          ),
        ),
      ),
    );
  }
}

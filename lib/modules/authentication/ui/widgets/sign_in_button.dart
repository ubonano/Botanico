import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find();

    return CustomButton(
      key: key ?? const Key('signInButton'),
      text: 'Iniciar Sesión',
      onPressed: controller.secureSubmit,
    );
  }
}

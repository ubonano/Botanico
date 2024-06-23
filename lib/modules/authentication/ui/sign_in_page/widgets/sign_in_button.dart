import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/buttons/custom_button.dart';
import '../../ui.dart';

class SignInButton extends GetView<SignInController> {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('signInButton'),
      text: 'Iniciar Sesión',
      onPressed: controller.secureSubmit,
    );
  }
}

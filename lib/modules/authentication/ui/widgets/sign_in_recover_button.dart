import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInRecoverButton extends StatelessWidget {
  const SignInRecoverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      key: key ?? const Key('SignInRecoverButton'),
      text: '¿Olvidaste tu contraseña?',
      onPressed: () => Get.dialog(SignInRecoverDialog()),
    );
  }
}

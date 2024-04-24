import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      key: key ?? const Key('forgotPasswordButton'),
      text: '¿Olvidaste tu contraseña?',
      onPressed: () => Get.dialog(const RecoverPasswordDialog()),
    );
  }
}

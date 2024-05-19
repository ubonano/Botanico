import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

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

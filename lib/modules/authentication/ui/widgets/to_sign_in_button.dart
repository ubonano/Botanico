import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToSignInButton extends StatelessWidget {
  const ToSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationService navigate = Get.find();

    return CustomTextButton(
      key: key ?? const Key('toSignInButton'),
      text: '¿Ya tenes cuenta? Inicia sesión',
      onPressed: navigate.toSignIn,
    );
  }
}

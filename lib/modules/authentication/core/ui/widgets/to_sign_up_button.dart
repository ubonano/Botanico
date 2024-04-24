import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToSignUpButton extends StatelessWidget {
  const ToSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationService navigate = Get.find();

    return CustomTextButton(
      key: key ?? const Key('toSignUpButton'),
      text: '¿No tenes cuenta? Crear nueva cuenta',
      onPressed: navigate.toSignUp,
    );
  }
}

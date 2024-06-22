import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

class SignUpNavigateButton extends StatelessWidget with NavigationHelperInstance {
  SignUpNavigateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      key: key ?? const Key('SignUpNavigateButton'),
      text: '¿No tenes cuenta? Crear nueva cuenta',
      onPressed: navigate.toSignUp,
    );
  }
}

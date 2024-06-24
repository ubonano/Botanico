import 'package:flutter/material.dart';

import '../../../../app/content/setup/navigation.dart';
import '../../../../app/ui/ui.dart';

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

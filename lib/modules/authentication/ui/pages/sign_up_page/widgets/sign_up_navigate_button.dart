import 'package:flutter/material.dart';

import '../../../../../app/ui/ui.dart';
import '../../../ui.dart';

class SignUpNavigateButton extends StatelessWidget {
  const SignUpNavigateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      key: key ?? const Key('SignUpNavigateButton'),
      text: '¿No tenes cuenta? Crear nueva cuenta',
      onPressed: () => SignUpPage.navigate(),
    );
  }
}

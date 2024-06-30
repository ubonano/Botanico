import 'package:flutter/material.dart';

import '../../../../../app/ui/ui.dart';
import '../../../ui.dart';

class SignInNavigateButton extends StatelessWidget {
  const SignInNavigateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      key: key ?? const Key('SignInNavigateButton'),
      text: '¿Ya tenes cuenta? Inicia sesión',
      onPressed: SignInPage.navigate,
    );
  }
}

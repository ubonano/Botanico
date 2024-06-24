import 'package:flutter/material.dart';

import '../../../../app/content/setup/navigation.dart';
import '../../../../app/ui/ui.dart';

class SignInNavigateButton extends StatelessWidget with NavigationHelperInstance {
  SignInNavigateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      key: key ?? const Key('SignInNavigateButton'),
      text: '¿Ya tenes cuenta? Inicia sesión',
      onPressed: navigate.toSignIn,
    );
  }
}

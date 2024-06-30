import 'package:flutter/material.dart';

import '../../../../../app/ui/navigation.dart';
import '../../../../../app/ui/ui.dart';
import '../../../ui.dart';

class SignInNavigateButton extends StatelessWidget with AppNavigationInstance {
  SignInNavigateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      key: key ?? const Key('SignInNavigateButton'),
      text: '¿Ya tenes cuenta? Inicia sesión',
      onPressed: SignInPage.navigate,
    );
  }
}

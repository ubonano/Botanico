import 'package:flutter/material.dart';

import '../../../../company/helpers/navigation_helper.dart';
import '../../../../company/ui/ui.dart';

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

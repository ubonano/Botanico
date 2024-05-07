import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';

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

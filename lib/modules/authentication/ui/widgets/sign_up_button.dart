import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpButton extends GetView<SignUpController> {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('signUpButton'),
      text: 'Registrar',
      onPressed: controller.secureSubmit,
    );
  }
}

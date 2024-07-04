import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../ui.dart';

class SignUpButton extends GetView<SignUpController> {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        key: key ?? const Key('signUpButton'),
        text: 'Registrar',
        onPressed: controller.secureSubmit,
        isLoading: controller.isLoading.value,
      ),
    );
  }
}

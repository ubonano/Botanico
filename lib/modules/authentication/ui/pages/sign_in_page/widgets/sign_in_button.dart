import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/widgets/buttons/custom_button.dart';
import '../../../ui.dart';

class SignInButton extends GetView<SignInController> {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        key: key ?? const Key('signInButton'),
        text: 'Iniciar Sesión',
        onPressed: controller.secureSubmit,
        isLoading: controller.isLoading.value,
      ),
    );
  }
}

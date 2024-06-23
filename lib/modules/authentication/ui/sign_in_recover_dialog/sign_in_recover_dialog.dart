import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../company/helpers/navigation_helper.dart';
import '../ui.dart';

class SignInRecoverDialog extends GetView<SignInRecoverController> with NavigationHelperInstance {
  SignInRecoverDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Recuperar contraseña'),
      content: Form(
        key: controller.formKey,
        child: EmailInputField(controller, onFieldSubmitted: controller.secureSubmit),
      ),
      actions: [
        TextButton(onPressed: navigate.back, child: const Text('Cancelar')),
        TextButton(onPressed: controller.secureSubmit, child: const Text('Enviar')),
      ],
    );
  }
}

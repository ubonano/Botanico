import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordDialog extends GetView<PasswordRecoverController> {
  const RecoverPasswordDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Recuperar contraseña'),
      content: Form(
        key: controller.formKey,
        child: EmailInputField(
          controller,
          onFieldSubmitted: controller.secureSubmit,
        ),
      ),
      actions: [
        TextButton(onPressed: controller.navigate.back, child: const Text('Cancelar')),
        TextButton(
          onPressed: controller.secureSubmit,
          child: const Text('Enviar'),
        ),
      ],
    );
  }
}

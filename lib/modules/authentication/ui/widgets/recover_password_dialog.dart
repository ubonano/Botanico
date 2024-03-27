import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordDialog extends GetView<RecoverPasswordController> {
  const RecoverPasswordDialog({Key? key}) : super(key: key);

  get _title => 'Recuperar contraseña';
  get _cancelButtonText => 'Cancelar';
  get _confirmButtonText => 'Enviar';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Form(
        key: controller.formKey,
        child: EmailInputField(
          controller: controller.getFieldController('email')!,
          onFieldSubmitted: controller.recoverPassword,
        ),
      ),
      actions: [
        TextButton(onPressed: controller.navigate.back, child: Text(_cancelButtonText)),
        TextButton(
          onPressed: controller.validateForm() ? controller.recoverPassword : () {},
          child: Text(_confirmButtonText),
        ),
      ],
    );
  }
}

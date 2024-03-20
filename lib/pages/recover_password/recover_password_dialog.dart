import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/input_fields/email_input_field.dart';
import 'recover_password_controller.dart';

class RecoverPasswordDialog extends GetView<RecoverPasswordController> {
  const RecoverPasswordDialog({Key? key}) : super(key: key);

  get _formKey => controller.formKey;

  get _emailCtrl => controller.textCtrls[0];

  void _submit() => controller.submit();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Recuperar contraseña"),
      content: Form(
        key: _formKey,
        child: EmailInputField(controller: _emailCtrl, onFieldSubmitted: _submit),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: const Text("Cancelar")),
        TextButton(onPressed: _submit, child: const Text("Enviar")),
      ],
    );
  }
}

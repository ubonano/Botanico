import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../ui/widgets/input_fields/email_input_field.dart';
import 'recover_password_controller.dart';

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
        TextButton(onPressed: Get.back, child: Text(_cancelButtonText)),
        TextButton(onPressed: controller.recoverPassword, child: Text(_confirmButtonText)),
      ],
    );
  }
}

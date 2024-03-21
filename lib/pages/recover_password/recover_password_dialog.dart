import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/input_fields/email_input_field.dart';
import 'recover_password_controller.dart';

class RecoverPasswordDialog extends GetView<RecoverPasswordController> {
  const RecoverPasswordDialog({Key? key}) : super(key: key);

  get _formKey => controller.formKey;
  get _title => 'Recuperar contraseña';
  get _cancelButtonText => 'Cancelar';
  get _confirmButtonText => 'Enviar';

  get _emailCtrl => controller.getFieldController('email');

  void _recoverPassword() => controller.recoverPassword();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Form(
        key: _formKey,
        child: EmailInputField(controller: _emailCtrl, onFieldSubmitted: _recoverPassword),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: Text(_cancelButtonText)),
        TextButton(onPressed: _recoverPassword, child: Text(_confirmButtonText)),
      ],
    );
  }
}

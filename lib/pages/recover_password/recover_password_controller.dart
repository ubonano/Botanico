import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_controller.dart';

class RecoverPasswordController extends GetxController with CustomController {
  @override
  String get logTag => 'RecoverPasswordController';

  @override
  // ignore: overridden_fields
  List<String> formFields = [
    'email',
  ];

  final formKey = GlobalKey<FormState>();

  void recoverPassword() async {
    if (formKey.currentState!.validate()) {
      await async.perform(
        operationName: 'Recover password',
        successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
        operation: (_) => auth.recoverPassword(
          getFieldValue('email'),
        ),
        onSuccess: navigate.back,
      );
    }
  }
}

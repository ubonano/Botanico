import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_controller.dart';

class RecoverPasswordController extends GetxController with CustomController {
  @override
  String get logTag => 'RecoverPasswordController';

  final formKey = GlobalKey<FormState>();
  final textCtrls = List.generate(1, (_) => TextEditingController());
  List<String> get _fieldValues => textCtrls.map((ctrl) => ctrl.text.trim()).toList();

  void submit() async {
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) => auth.recoverPassword(_fieldValues[0]),
      onSuccess: () => navigate.back(),
    );
  }

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  // ignore: avoid_function_literals_in_foreach_calls
  void disposeControllers() => textCtrls.forEach((controller) => controller.dispose());
}

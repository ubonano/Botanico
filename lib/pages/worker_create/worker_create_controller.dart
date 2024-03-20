import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';
import '../../models/worker_model.dart';

class WorkerCreateController extends GetxController with CustomController {
  @override
  String get logTag => 'WorkerCreateController';

  final formKey = GlobalKey<FormState>();
  final textCtrls = List.generate(4, (_) => TextEditingController());
  List<String> get _fieldValues => textCtrls.map((ctrl) => ctrl.text.trim()).toList();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Create worker',
      successMessage: 'Trabajador creado!',
      operation: _handleOperation,
      onSuccess: navigate.toLobby,
    );
  }

  Future<void> _handleOperation(_) async {
    await workerService.create(
      WorkerModel(
        uid: loggedUserUID,
        email: loggedUserEmail,
        name: _fieldValues[0],
        birthDate: _fieldValues[1],
        phone: _fieldValues[2],
        dni: _fieldValues[3],
      ),
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

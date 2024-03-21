import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';
import '../../models/worker_model.dart';

class WorkerCreateController extends GetxController with CustomController {
  @override
  String get logTag => 'WorkerCreateController';

  @override
  // ignore: overridden_fields
  List<String> formFields = [
    'name',
    'birthDate',
    'phone',
    'dni',
  ];

  final formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      await async.perform(
        operationName: 'Create worker',
        successMessage: 'Trabajador creado!',
        operation: (_) async {
          await workerService.create(
            WorkerModel(
              uid: loggedUserUID,
              email: loggedUserEmail,
              name: getFieldValue('name'),
              birthDate: getFieldValue('birthDate'),
              phone: getFieldValue('phone'),
              dni: getFieldValue('dni'),
            ),
          );
        },
        onSuccess: navigate.toLobby,
      );
    }
  }
}

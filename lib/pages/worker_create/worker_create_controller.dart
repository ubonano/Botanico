import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';
import '../../models/worker_model.dart';

class WorkerCreateController extends GetxController with CustomController {
  @override
  String get logTag => 'WorkerCreateController';

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneController = TextEditingController();
  final dniController = TextEditingController();

  String get _name => nameController.text.trim();
  String get _birthDate => birthDateController.text.trim();
  String get _phone => phoneController.text.trim();
  String get _dni => dniController.text.trim();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Create worker',
      successMessage: 'Trabajador creado!',
      operation: (_) async {
        await _createWorker(loggedUserUID, loggedUserEmail);
      },
      onSuccess: () async {
        await fetchWorker();
        navigate.toLobby();
      },
    );
  }

  Future<void> _createWorker(String userId, String email) async {
    await workerService.create(
      WorkerModel(
        uid: userId,
        email: email,
        name: _name,
        birthDate: _birthDate,
        phone: _phone,
        dni: _dni,
      ),
    );
  }

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  void disposeControllers() {
    nameController.dispose();
    birthDateController.dispose();
    phoneController.dispose();
    dniController.dispose();
  }
}

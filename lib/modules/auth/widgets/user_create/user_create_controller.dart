import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../foundation/utils/custom_controller.dart';
import '../../models/user_model.dart';

class UserCreateController extends GetxController with CustomController {
  @override
  String get logTag => 'UserCreateController';

  final userFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneController = TextEditingController();
  final dniController = TextEditingController();

  String get _name => nameController.text.trim();
  String get _birthDate => birthDateController.text.trim();
  String get _phone => phoneController.text.trim();
  String get _dni => dniController.text.trim();

  Future<void> submit() async {
    if (!userFormKey.currentState!.validate()) return;

    await async.perform(
        operationName: 'Submit user',
        successMessage: 'Perfil creado!',
        operation: () async {
          userService.create(
            UserModel(
              uid: loggedUserUID,
              email: loggedUserEmail,
              name: _name,
              birthDate: _birthDate,
              phone: _phone,
              dni: _dni,
            ),
          );

          await fetchUser();
        },
        onSuccess: navigate.toLobby);
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

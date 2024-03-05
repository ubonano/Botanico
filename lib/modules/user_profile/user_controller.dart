import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../foundation/utils/custom_controller.dart';
import 'user_model.dart';

//Refactor: unificar el auth service en el userProfile... Quitar el profile y dejar solo user.. mover todo al modulo auth, y cambiarlo a modulo user...

class UserController extends GetxController with CustomController {
  @override
  String get logTag => 'UserController';

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
      successMessage: 'Perfil guardado con exito',
      operation: () async {
        userService.set(
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
      onSuccess: () => navigate.toLobby(), // TODO cuando el usuario ya tenia un perfil ecreado, dede navegar a home
    );
  }

  Future<void> initializeControllers() async {
    if (isUserLoaded) {
      setControllers(user!);
    } else {
      clear();
    }
  }

  void setControllers(UserModel user) {
    nameController.text = user.name;
    birthDateController.text = user.birthDate;
    phoneController.text = user.phone;
    dniController.text = user.dni;
  }

  void clear() {
    nameController.clear();
    birthDateController.clear();
    phoneController.clear();
    dniController.clear();
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

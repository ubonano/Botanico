import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../foundation/services/common_services.dart';
import '../foundation/utils/log_lifecycle.dart';
import 'user_profile_model.dart';

class UserProfileController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'UserProfileController';

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneController = TextEditingController();
  final dniController = TextEditingController();

  String get _name => nameController.text.trim();
  String get _birthDate => birthDateController.text.trim();
  String get _phone => phoneController.text.trim();
  String get _dni => dniController.text.trim();

  UserProfileModel get newUserProfile => UserProfileModel(
        uid: authService.currentUser!.uid,
        email: authService.currentUser!.email!,
        name: _name,
        birthDate: _birthDate,
        phone: _phone,
        dni: _dni,
      );

  Future<void> createUserProfile() async {
    await asyncOperationService.performOperation(
      operation: () => userProfileService.setUserProfile(newUserProfile),
      operationName: 'Create user profile',
      successMessage: 'Perfil creado con exito',
    );

    navigationService.toLobby();
  }

  Future<void> initializeControllers() async {
    if (userProfileService.hasUserProfile) {
      setControllers(userProfileService.currentUserProfile!);
    } else {
      clearControllers();
    }
  }

  void setControllers(UserProfileModel userProfile) {
    nameController.text = userProfile.name;
    birthDateController.text = userProfile.birthDate;
    phoneController.text = userProfile.phone;
    dniController.text = userProfile.dni;
  }

  void clearControllers() {
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

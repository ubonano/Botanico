import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../foundation/config/common_services.dart';
import '../../foundation/config/log_lifecycle_controller.dart';
import '../models/user_profile_model.dart';

class UserProfileController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'UserProfileController';

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneController = TextEditingController();
  final dniController = TextEditingController();

  Future<void> initializeFormFields() async {
    if (authService.isUserProfile) {
      updateFormFields(authService.userProfile!);
    } else {
      clearFormFields();
    }
  }

  Future<void> createUserProfile() async {
    final user = authService.currentUser;

    final userProfileModel = UserProfileModel(
      uid: user!.uid,
      email: user.email!,
      name: nameController.text,
      birthDate: birthDateController.text,
      phone: phoneController.text,
      dni: dniController.text,
    );

    await authService.setUserProfile(userProfileModel);

    navigationService.navigateToHome();
  }

  void updateFormFields(UserProfileModel userProfile) {
    nameController.text = userProfile.name;
    birthDateController.text = userProfile.birthDate;
    phoneController.text = userProfile.phone;
    dniController.text = userProfile.dni;
  }

  void clearFormFields() {
    nameController.clear();
    birthDateController.clear();
    phoneController.clear();
    dniController.clear();
  }

  void disposeFormFields() {
    nameController.dispose();
    birthDateController.dispose();
    phoneController.dispose();
    dniController.dispose();
  }

  @override
  void onClose() {
    disposeFormFields();

    super.onClose();
  }
}

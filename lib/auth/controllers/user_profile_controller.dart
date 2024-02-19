import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/common_services.dart';
import '../models/user_profile_model.dart';
import '../services/user_profile_service.dart';

class UserProfileController extends GetxController with CommonServices {
  final UserProfileService _userProfileService = Get.find();

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final dniController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initializeFormFieldsWithUserProfile();
  }

  @override
  void onClose() {
    disposeFormFields();
    super.onClose();
  }

  void initializeFormFieldsWithUserProfile() {
    final userProfile = authController.userProfile.value;
    if (userProfile != null) {
      updateFormFields(userProfile);
    } else {
      clearFormFields();
    }
  }

  void updateFormFields(UserProfileModel userProfile) {
    nameController.text = userProfile.name;
    dobController.text = userProfile.dob;
    phoneController.text = userProfile.phone;
    dniController.text = userProfile.dni;
  }

  void clearFormFields() {
    nameController.clear();
    dobController.clear();
    phoneController.clear();
    dniController.clear();
  }

  void disposeFormFields() {
    nameController.dispose();
    dobController.dispose();
    phoneController.dispose();
    dniController.dispose();
  }

  Future<void> createUserProfile() async {
    final user = authController.getLoggedInUser();
    if (user == null) {
      loggingService.logError('No hay usuario logueado');
      return;
    }

    final userProfileModel = UserProfileModel(
      uid: user.uid,
      email: user.email!,
      name: nameController.text,
      dob: dobController.text,
      phone: phoneController.text,
      dni: dniController.text,
    );

    try {
      await _userProfileService.setUserProfile(userProfileModel);

      authController.userProfile.value = userProfileModel;

      loggingService.logInfo('Perfil de usuario creado/actualizado');

      navigationService.navigateToHome();
    } catch (e) {
      loggingService.logError(
          'Error al crear/actualizar el perfil del usuario: ${e.toString()}');
      Get.snackbar('Error', 'Error al crear/actualizar el perfil del usuario');
    }
  }
}

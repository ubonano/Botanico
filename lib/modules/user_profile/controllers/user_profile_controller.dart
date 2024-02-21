import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/common_services.dart';
import '../models/user_profile_model.dart';
import '../services/user_profile_service.dart';

class UserProfileController extends GetxController with CommonServices {
  final UserProfileService _userProfileService = Get.find();

  Rx<UserProfileModel?> userProfile = Rx<UserProfileModel?>(null);

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneController = TextEditingController();
  final dniController = TextEditingController();

  Future<UserProfileModel?> getUserProfile() async {
    User? user = authController.getLoggedInUser();

    if (user != null) {
      return await _userProfileService.getUserProfile(user.uid);
    }

    return null;
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
      birthDate: birthDateController.text,
      phone: phoneController.text,
      dni: dniController.text,
    );

    try {
      await _userProfileService.setUserProfile(userProfileModel);

      loggingService.logInfo('Perfil de usuario creado/actualizado');

      navigationService.navigateToHome();
    } catch (e) {
      loggingService.logError(
          'Error al crear/actualizar el perfil del usuario: ${e.toString()}');
      Get.snackbar('Error', 'Error al crear/actualizar el perfil del usuario');
    }
  }

  Future<void> initializeFormFields() async {
    // ignore: no_leading_underscores_for_local_identifiers
    UserProfileModel? _userProfile = await getUserProfile();

    if (_userProfile != null) {
      userProfile.value = _userProfile;
      updateFormFields(_userProfile);
    } else {
      clearFormFields();
    }
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

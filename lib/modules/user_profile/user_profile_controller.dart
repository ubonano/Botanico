import 'package:firebase_auth/firebase_auth.dart';
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

  User? get _currentUser => authService.currentUser;
  UserProfileModel? get _currentUserProfile => userProfileService.userProfile;
  bool get _isUserProfile => userProfileService.isUserProfile;

  UserProfileModel get newUserProfile => UserProfileModel(
        uid: _currentUser!.uid,
        email: _currentUser!.email!,
        name: nameController.text,
        birthDate: birthDateController.text,
        phone: phoneController.text,
        dni: dniController.text,
      );

  Future<void> initializeControllers() async {
    if (_isUserProfile) {
      setControllers(_currentUserProfile!);
    } else {
      clearControllers();
    }
  }

  Future<void> createUserProfile() async {
    await asyncOperationService.performOperation(operation: () => userProfileService.setUserProfile(newUserProfile));

    navigationService.toLobby();
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

  void disposeControllers() {
    nameController.dispose();
    birthDateController.dispose();
    phoneController.dispose();
    dniController.dispose();
  }

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }
}

import 'package:botanico/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../services/loggin_service.dart';
import '../models/user_profile_model.dart';
import '../services/user_profile_service.dart';
import 'auth_controller.dart';

class UserProfileController extends GetxController {
  final UserProfileService _userProfileService = Get.find();
  final LoggingService _loggingService = Get.find();
  final NavigationService _navigationService = Get.find();

  Rx<UserProfileModel?> currentUserProfile = Rx<UserProfileModel?>(null);

  bool get isProfileComplete => currentUserProfile.value?.isComplete ?? false;

  User? _getLoggedInUser() => Get.find<AuthController>().getLoggedInUser();

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  void loadUserProfile() async {
    final user = _getLoggedInUser();

    if (user != null) {
      currentUserProfile.value =
          await _userProfileService.getUserProfile(user.uid);

      _navigationService.navigateToHome();

      _loggingService.logInfo(
          'Perfil de usuario cargado: UID=${user.uid} Email=${user.email}');
    } else {
      _loggingService.logWarning('No hay usuario logueado para cargar perfil');
    }
  }

  Future<void> createUserProfile({
    required String name,
    required String dob,
    required String phone,
    required String dni,
  }) async {
    final user = _getLoggedInUser();

    if (user != null) {
      final userProfileModel = UserProfileModel(
        uid: user.uid,
        email: user.email!,
        name: name,
        dob: dob,
        phone: phone,
        dni: dni,
      );

      await _userProfileService.setUserProfile(userProfileModel);

      currentUserProfile.value = userProfileModel;
      
      _loggingService.logInfo(
          'Perfil de usuario creado/actualizado para UID: ${user.uid} Email: ${user.email}');
    } else {
      _loggingService
          .logError('Intento de crear/actualizar perfil sin usuario logueado');
    }
  }
}

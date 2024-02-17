import 'package:get/get.dart';
import '../../services/loggin_service.dart';
import '../models/user_profile_model.dart';
import '../services/user_profile_service.dart';
import 'auth_controller.dart';

class UserProfileController extends GetxController {
  final UserProfileService _userProfileService = Get.find();
  final LoggingService _loggingService = Get.find();
  final AuthController _authController = Get.find();

  Future<void> createUserProfile({
    required String name,
    required String dob,
    required String phone,
    required String dni,
  }) async {
    try {
      final user = _authController.getLoggedInUser();

      final userProfileModel = UserProfileModel(
        uid: user!.uid,
        email: user.email!,
        name: name,
        dob: dob,
        phone: phone,
        dni: dni,
      );

      await _userProfileService.setUserProfile(userProfileModel);

      _authController.userProfile.value = userProfileModel;

      _loggingService.logInfo(
          'Perfil de usuario creado/actualizado para UID: ${user.uid} Email: ${user.email}');
    } catch (e) {
      _loggingService
          .logError('Error al crear perfil del usuario: ${e.toString()}');
      Get.snackbar('Error', 'Error al crear perfil de usuario');
    }
  }
}

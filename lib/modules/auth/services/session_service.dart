import 'package:botanico/modules/foundation/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../user_profile/models/user_profile_model.dart';
import '../../user_profile/services/user_profile_service.dart';

class SessionService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final NavigationService _navigationService = Get.find();
  final UserProfileService _userProfileService = Get.find();

  final Rx<User?> _firebaseUser = Rx<User?>(null);
  final Rx<UserProfileModel?> userProfileObx = Rx<UserProfileModel?>(null);

  User? get currentUser => _firebaseUser.value;
  UserProfileModel? get userProfile => userProfileObx.value;

  bool get isUserLoggedIn => _auth.currentUser != null;

  SessionService() {
    _firebaseUser.bindStream(_auth.authStateChanges());

    _firebaseUser.listen(
      (user) async {
        if (user != null) {
          await fetchUserProfile();

          if (userProfile != null) {
            _navigationService.navigateToHome();
          } else {
            _navigationService.navigateToUserProfile();
          }
        } else {
          userProfileObx.value = null;
        }
      },
    );
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      Get.snackbar('Error al iniciar sesión', _getErrorMessage(e));
      return null;
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      Get.snackbar('Error al registrar usuario', _getErrorMessage(e));
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Future<void> fetchUserProfile() async {
  //   if (currentUser != null) {
  //     await _loadUserProfile(currentUser!.uid);
  //   }
  // }

  Future<void> fetchUserProfile() async {
    if (currentUser != null) {
      try {
        final userProfile =
            await _userProfileService.getUserProfile(currentUser!.uid);

        userProfileObx.value = userProfile;
      } catch (e) {
        Get.snackbar('Error al cargar perfil de usuario', e.toString());
      }
    }
  }

  Future<void> setUserProfile(UserProfileModel userProfile) async {
    try {
      await _userProfileService.setUserProfile(userProfile);

      userProfileObx.value = userProfile;
    } catch (e) {
      Get.snackbar('Error al actualizar perfil de usuario', e.toString());
    }
  }
}

String _getErrorMessage(Object e) {
  if (e is FirebaseAuthException) {
    if (e.message!.contains('email-already-in-use')) {
      return 'El email ya está en uso por otra cuenta.';
    } else if (e.message!.contains('user-not-found')) {
      return 'No se encontró usuario con este email.';
    } else if (e.message!.contains('wrong-password')) {
      return 'La contraseña es incorrecta.';
    } else if (e.message!.contains('user-disabled')) {
      return 'El usuario ha sido deshabilitado.';
    } else if (e.message!.contains('too-many-requests')) {
      return 'Demasiadas solicitudes. Por favor, intenta de nuevo más tarde.';
    } else if (e.message!.contains('operation-not-allowed')) {
      return 'La operación no está permitida.';
    } else if (e.message!
        .contains('account-exists-with-different-credential')) {
      return 'Ya existe una cuenta con el mismo email pero diferentes credenciales de inicio de sesión.';
    } else if (e.message!.contains('invalid-credential')) {
      return 'Credencial inválida proporcionada para iniciar sesión.';
    } else if (e.message!.contains('weak-password')) {
      return 'La contraseña es demasiado débil. Por favor, elige una contraseña más fuerte.';
    } else if (e.message!.contains('invalid-email')) {
      return 'El email proporcionado no es válido.';
    }
  }
  return 'Ocurrió un error desconocido. Por favor, inténtalo de nuevo más tarde.';
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../config/common_services.dart';
import '../../user_profile/models/user_profile_model.dart';
import '../../user_profile/services/user_profile_service.dart';

class AuthController extends GetxController with CommonServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final UserProfileService _userProfileService = Get.find();

  User? getLoggedInUser() => _auth.currentUser;
  bool isUserLoggedIn() => _auth.currentUser != null;

  Future<User?> _authOperation(
    Future<UserCredential> Function() operation,
    String successLog,
    String errorLog,
  ) async {
    try {
      final UserCredential userCredential = await operation();

      loggingService.logInfo(
          '$successLog: UID=${userCredential.user?.uid}, Email=${userCredential.user?.email}');

      await _navigate(userCredential.user!.uid);

      return userCredential.user;
    } catch (e) {
      loggingService.logError('$errorLog: ${e.toString()}');
      Get.snackbar('Error', _getErrorMessage(e));
      return null;
    }
  }

  Future<void> _navigate(String uid) async {
    try {
      UserProfileModel? userProfile =
          await _userProfileService.getUserProfile(uid);

      if (userProfile != null) {
        loggingService.logInfo('Perfil de usuario encontrado para UID=$uid');
        navigationService.navigateToHome();
      } else {
        navigationService.navigateToUserProfile();
        loggingService
            .logWarning('No se encontro perfil para el el usuario UID=$uid');
      }
    } catch (e) {
      loggingService
          .logError('Error al cargar el perfil de usuario: ${e.toString()}');
    }
  }

  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return _authOperation(
      () => _auth.createUserWithEmailAndPassword(
          email: email, password: password),
      'Registro exitoso',
      'Error al registrar',
    );
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return _authOperation(
      () => _auth.signInWithEmailAndPassword(email: email, password: password),
      'Inicio de sesión exitoso',
      'Error al iniciar sesión',
    );
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();

      loggingService.logInfo('Cierre de sesión exitoso');

      navigationService.navigateToLogin();
    } catch (e) {
      loggingService.logError('Error al cerrar sesión: ${e.toString()}');
      Get.snackbar('Error al cerrar sesión',
          'No se pudo cerrar sesión correctamente. Inténtalo de nuevo.');
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
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../../config/routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final Logger logger;

  AuthController({
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
    required Logger logger,
  })  : _auth = auth,
        _googleSignIn = googleSignIn,
        logger = logger;

  User? getLoggedInUser() {
    return _auth.currentUser;
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      logger.i(
          'Registro exitoso: UID=${userCredential.user?.uid}, Email=${userCredential.user?.email}');

      _toHome();

      return userCredential.user;
    } catch (e) {
      logger.e('Error al registrar: ${e.toString()}');
      Get.snackbar('Error al registrar', _getErrorMessage(e));
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      logger.i(
          'Inicio de sesión exitoso: UID=${userCredential.user?.uid}, Email=${userCredential.user?.email}');

      _toHome();

      return userCredential.user;
    } catch (e) {
      logger.e('Error al iniciar sesión: ${e.toString()}');
      Get.snackbar('Error al iniciar sesión', _getErrorMessage(e));

      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        logger.i(
            'Inicio de sesión con Google exitoso: UID=${userCredential.user?.uid}, Email=${userCredential.user?.email}');

        _toHome();

        return userCredential.user;
      }
      return null;
    } catch (e) {
      logger.e('Error al iniciar sesión con Google: ${e.toString()}');
      Get.snackbar('Error al iniciar sesión con Google', _getErrorMessage(e));
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();

      await _auth.signOut();

      logger.i('Cierre de sesión exitoso');

      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      logger.e('Error al cerrar sesión: ${e.toString()}');
      Get.snackbar('Error al cerrar sesión',
          'No se pudo cerrar sesión correctamente. Inténtalo de nuevo.');
    }
  }

  void _toHome() {
    Get.offAllNamed(Routes.HOME);
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

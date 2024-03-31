import 'package:botanico/modules/foundation/services/log_service.dart';
import 'package:botanico/modules/foundation/services/snackbar_service.dart';
import 'package:botanico/modules/authentication/services/auth_service.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OperationManagerService extends GetxService {
  late final FirebaseFirestore _firestore = Get.find();
  late final LogService _logService = Get.find();
  late final SnackbarService _snackbar = Get.find();
  late final AuthService _session = Get.find();

  Future<void> perform({
    required Future Function(Transaction? txn) operation,
    String operationName = "Operation",
    String permissionKey = '',
    String successMessage = '',
    bool showErrorMessageBySnackbar = true,
    Function()? onSuccess,
    Function(Object error)? onError,
    Function()? onFinalize,
    bool inTransaction = false,
  }) async {
    try {
      if (_hasPermission(permissionKey)) throw Exception('permission-denied');

      await _executeOperation(operation, inTransaction);

      if (successMessage.isNotEmpty) _snackbar.success(successMessage);
      _logService.info("$operationName exitosa.");

      onSuccess?.call();
    } catch (e) {
      if (showErrorMessageBySnackbar) _snackbar.error(_getErrorMessage(e));
      _logService.error("$operationName fallida: ${_getErrorMessage(e)}", e);

      onError?.call(e);
    } finally {
      onFinalize?.call();
    }
  }

  bool _hasPermission(String permissionKey) =>
      permissionKey.isNotEmpty && !_session.worker!.hasPermission(permissionKey);

  Future<void> _executeOperation<T>(Future<T> Function(Transaction? txn) operation, bool inTransaction) async {
    if (inTransaction) {
      _firestore.runTransaction((Transaction txn) async => await operation(txn));
      // .catchError((e) => throw Exception('aaaaa'));
    } else {
      await operation(null);
    }
  }
}

String _getErrorMessage(Object e) {
  if (e is FirebaseAuthException) {
    if (e.code.contains('email-already-in-use')) {
      return 'El email ya está en uso por otra cuenta.';
    } else if (e.code.contains('user-not-found')) {
      return 'No se encontró usuario con este email.';
    } else if (e.code.contains('wrong-password')) {
      return 'La contraseña es incorrecta.';
    } else if (e.code.contains('user-disabled')) {
      return 'El usuario ha sido deshabilitado.';
    } else if (e.code.contains('too-many-requests')) {
      return 'Demasiadas solicitudes. Por favor, intenta de nuevo más tarde.';
    } else if (e.code.contains('operation-not-allowed')) {
      return 'La operación no está permitida.';
    } else if (e.code.contains('account-exists-with-different-credential')) {
      return 'Ya existe una cuenta con el mismo email pero diferentes credenciales de inicio de sesión.';
    } else if (e.code.contains('invalid-credential')) {
      return 'Credencial inválida proporcionada para iniciar sesión.';
    } else if (e.code.contains('weak-password')) {
      return 'La contraseña es demasiado débil. Por favor, elige una contraseña más fuerte.';
    } else if (e.code.contains('invalid-email')) {
      return 'El email proporcionado no es válido.';
    }
  }

  if (e.toString().contains('permission-denied')) {
    return 'No tiene permiso para realziar esta operación';
  }

  if (e is WorkerNotFoundException) {
    return e.message;
  }

  return e.toString();
}

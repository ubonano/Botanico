import 'package:botanico/utils/custom_exceptions.dart';
import 'package:botanico/services/log_service.dart';
import 'package:botanico/services/snackbar_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

/// `AsyncOperationService` is designed to facilitate the execution of asynchronous operations,
/// potentially within a Firebase Firestore transaction. It provides structured error handling,
/// logging, and success messaging functionalities.
///
/// It utilizes [LogService] for logging and [SnackbarService] for displaying messages to the user.
class AsyncOperationService extends GetxService {
  /// Services for logging and displaying snackbars.
  final _logService = Get.find<LogService>();
  final _snackbar = Get.find<SnackbarService>();

  /// Performs an asynchronous operation, optionally within a Firestore transaction.
  ///
  /// - [operation]: The asynchronous operation to be performed. It may optionally involve a Firestore transaction.
  /// - [operationName]: A descriptive name for the operation, used in logging.
  /// - [successMessage]: A message to be displayed upon successful completion of the operation.
  /// - [showErrorMessageBySnackbar]: Whether to show error messages via Snackbar.
  /// - [onSuccess]: An optional callback function that gets called upon successful completion of the operation.
  /// - [onError]: An optional callback function that gets called if the operation fails.
  /// - [onFinalize]: An optional callback function that gets called after the operation completes, regardless of success or failure.
  /// - [inTransaction]: Specifies whether the operation should be executed within a Firestore transaction.
  ///
  /// Returns the result of the operation if successful, or null if an error occurs.
  Future<T?> perform<T>({
    required Future<T> Function(Transaction? txn) operation,
    String operationName = "Operation",
    String successMessage = '',
    bool showErrorMessageBySnackbar = true,
    Function()? onSuccess,
    Function(Object error)? onError,
    Function()? onFinalize,
    bool inTransaction = false,
  }) async {
    try {
      T result = await _executeOperation(operation, inTransaction);

      if (successMessage.isNotEmpty) _snackbar.success(successMessage);
      _logService.info("$operationName exitosa.");

      onSuccess?.call();
      return result;
    } catch (e) {
      if (showErrorMessageBySnackbar) _snackbar.error(_getErrorMessage(e));
      _logService.error("$operationName fallida: ${_getErrorMessage(e)}", e);

      onError?.call(e);
      return null;
    } finally {
      onFinalize?.call();
    }
  }

  /// A helper method to execute the provided asynchronous operation, with or without a transaction.
  ///
  /// - [operation]: The operation to execute.
  /// - [inTransaction]: Whether to execute the operation within a Firestore transaction.
  ///
  /// Returns the result of executing the operation.
  Future<T> _executeOperation<T>(Future<T> Function(Transaction? txn) operation, bool inTransaction) async {
    if (inTransaction) {
      return FirebaseFirestore.instance.runTransaction<T>((Transaction txn) async => await operation(txn));
    } else {
      return await operation(null);
    }
  }
}

/// Generates an appropriate error message based on the caught exception.
///
/// - [error]: The exception or error caught during the operation execution.
///
/// Returns a user-friendly error message.
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
    return 'No tiene acceso a la información solicitada.';
  }

  if (e is WorkerNotFoundException) {
    return e.message;
  }

  return e.toString();
}

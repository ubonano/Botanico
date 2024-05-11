import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/worker/module.dart';

class OperationHelper with GlobalHelper {
  late final FirebaseFirestore _firestore = Get.find();
  late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();

  // TODO No esta funcionando la transaccion como deberia... Si falla no hace el rollback de lo que ya ejecuto previamente
  Future<void> perform({
    required Future Function(Transaction? txn) operation,
    String operationName = "Operation",
    String permissionKey = '',
    String successMessage = '',
    bool showErrorMessageBySnackbar = true,
    Function()? onSuccess,
    Function(Object error)? onError,
    bool inTransaction = false,
  }) async {
    if (inTransaction) {
      await _firestore.runTransaction(
        (Transaction txn) async {
          await _executeWithHandling(
            operation: () async => await operation(txn),
            operationName: operationName,
            permissionKey: permissionKey,
            successMessage: successMessage,
            showErrorMessageBySnackbar: showErrorMessageBySnackbar,
            onSuccess: onSuccess,
            onError: onError,
          );
        },
      );
    } else {
      await _executeWithHandling(
        operation: () async => await operation(null),
        operationName: operationName,
        permissionKey: permissionKey,
        successMessage: successMessage,
        showErrorMessageBySnackbar: showErrorMessageBySnackbar,
        onSuccess: onSuccess,
        onError: onError,
      );
    }
  }

  Future<void> _executeWithHandling({
    required Future Function() operation,
    String operationName = "Operation",
    String permissionKey = '',
    String successMessage = '',
    bool showErrorMessageBySnackbar = true,
    Function()? onSuccess,
    Function(Object error)? onError,
  }) async {
    try {
      log.info("Executing $operationName.");
      if (permissionKey.isNotEmpty && await _hasPermission(permissionKey)) throw Exception('permission-denied');

      await operation();

      if (successMessage.isNotEmpty) snackbar.success(successMessage);
      log.info("$operationName exitosa.");

      onSuccess?.call();
    } catch (e) {
      if (showErrorMessageBySnackbar) snackbar.error(_getErrorMessage(e));
      log.error("$operationName fallida: ${_getErrorMessage(e)}", e);

      onError?.call(e);
    }
  }

  // TODO refactorizar para que no busque siempre el trabajador en la base de datos
  Future<bool> _hasPermission(String permissionKey) async {
    final worker = await _workerBusinessLogic.fetchLoggedWorker();

    if (worker == null) throw WorkerNotFoundException();

    return permissionKey.isNotEmpty && !worker.hasPermission(permissionKey);
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

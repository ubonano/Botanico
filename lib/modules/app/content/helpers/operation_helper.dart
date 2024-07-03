import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../worker/content/setup/exceptions/worker_not_found_exception.dart';
import '../../../worker/content/setup/interfaces/i_worker_service.dart';
import '../../../company/setup/interfaces/i_company_service.dart';
import 'global_helper.dart';

class OperationHelper with GlobalHelper {
  late final FirebaseFirestore _firestore = Get.find();
  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  Future<T?> perform<T>({
    required Future<T?> Function(Transaction? txn) operation,
    String operationName = "Operation",
    String permissionKey = '',
    IModuleStructure? module,
    String successMessage = '',
    String? errorMessage,
    bool showErrorMessageBySnackbar = true,
    Function()? onSuccess,
    Function(Object error)? onError,
    bool inTransaction = false,
  }) async {
    T? result;
    if (module != null && !_hasModuleActive(module.id)) {
      throw Exception('module-not-active');
    }

    if (permissionKey.isNotEmpty && _hasPermission(permissionKey)) throw Exception('permission-denied');

    if (inTransaction) {
      result = await _firestore.runTransaction(
        (Transaction txn) async {
          return await _executeWithHandling(
            operation: () async => await operation(txn),
            operationName: operationName,
            successMessage: successMessage,
            errorMessage: errorMessage,
            showErrorMessageBySnackbar: showErrorMessageBySnackbar,
            onSuccess: onSuccess,
            onError: onError,
          );
        },
      );
    } else {
      result = await _executeWithHandling<T>(
        operation: () async => await operation(null),
        operationName: operationName,
        successMessage: successMessage,
        errorMessage: errorMessage,
        showErrorMessageBySnackbar: showErrorMessageBySnackbar,
        onSuccess: onSuccess,
        onError: onError,
      );
    }
    return result;
  }

  Future<T?> _executeWithHandling<T>({
    required Future<T?> Function() operation,
    String operationName = "Operation",
    String successMessage = '',
    String? errorMessage,
    bool showErrorMessageBySnackbar = true,
    Function()? onSuccess,
    Function(Object error)? onError,
  }) async {
    try {
      log.info("Executing $operationName.");

      T? result = await operation();

      if (successMessage.isNotEmpty) snackbar.success(successMessage);
      log.info("$operationName exitosa.");

      onSuccess?.call();
      return result;
    } catch (e) {
      String finalErrorMessage = errorMessage ?? _getErrorMessage(e);
      if (showErrorMessageBySnackbar) snackbar.error(finalErrorMessage);
      log.error("$operationName fallida: $finalErrorMessage", e);

      onError?.call(e);

      rethrow;
    }
  }

  bool _hasModuleActive(String moduleId) => _companyService.currentCompany$!.hasModuleActive(moduleId);

  bool _hasPermission(String permissionKey) =>
      permissionKey.isNotEmpty && !_workerService.currentWorker$!.hasPermission(permissionKey);
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

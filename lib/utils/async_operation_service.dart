import 'package:botanico/utils/custom_exceptions.dart';
import 'package:botanico/utils/log_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsyncOperationService extends GetxService {
  final _logService = Get.find<LogService>();

  Future<T?> perform<T>({
    required Future<T> Function(Transaction? txn) operation,
    String operationName = "Operacion",
    String successMessage = '',
    bool showErrorMessageBySnackbar = true,
    Function()? onSuccess,
    Function(Object error)? onError,
    bool inTransaction = false,
  }) async {
    try {
      T result;
      if (inTransaction) {
        result = await FirebaseFirestore.instance.runTransaction<T>((Transaction txn) async {
          return await operation(txn);
        });
      } else {
        result = await operation(null);
      }

      if (successMessage != '') {
        Get.snackbar('Éxito', successMessage, backgroundColor: Colors.green, colorText: Colors.white);
      }

      _logService.info("$operationName exitosa.");

      if (onSuccess != null) {
        onSuccess();
      }

      return result;
    } catch (e) {
      if (showErrorMessageBySnackbar) {
        Get.snackbar('Error', _getErrorMessage(e), backgroundColor: Colors.red, colorText: Colors.white);
      }

      _logService.error("$operationName fallida: ${_getErrorMessage(e)}", e);

      if (onError != null) {
        onError(e);
      }
      return null;
    }
  }
}

String _getErrorMessage(e) {
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
    } else if (e.message!.contains('account-exists-with-different-credential')) {
      return 'Ya existe una cuenta con el mismo email pero diferentes credenciales de inicio de sesión.';
    } else if (e.message!.contains('invalid-credential')) {
      return 'Credencial inválida proporcionada para iniciar sesión.';
    } else if (e.message!.contains('weak-password')) {
      return 'La contraseña es demasiado débil. Por favor, elige una contraseña más fuerte.';
    } else if (e.message!.contains('invalid-email')) {
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

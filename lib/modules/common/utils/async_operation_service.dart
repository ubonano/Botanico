import 'package:botanico/modules/common/utils/common_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsyncOperationService extends GetxService with CommonServices {
  Future<T?> performAsyncAuthOperation<T>(
    Future<T> Function() operation, {
    String operationName = "Operacion",
  }) async {
    try {
      T result = await operation();

      loggingService.logInfo("$operationName exitosa.");

      return result;
    } catch (e) {
      Get.snackbar('Error', _getErrorMessage(e), backgroundColor: Colors.red, colorText: Colors.white);

      loggingService.logError("$operationName fallida: ${_getErrorMessage(e)}", e);

      return null;
    }
  }

  Future<T?> performAsyncOperation<T>(
    Future<T> Function() operation, {
    String successMessage = '',
    required String errorMessage,
    String operationName = "Operacion",
  }) async {
    try {
      T result = await operation();

      if (successMessage.isNotEmpty) {
        Get.snackbar('Éxito', successMessage, backgroundColor: Colors.green, colorText: Colors.white);
      }

      loggingService.logInfo("$operationName exitosa.");

      return result;
    } catch (e) {
      Get.snackbar('Error', '$errorMessage: ${e.toString()}', backgroundColor: Colors.red, colorText: Colors.white);

      loggingService.logError("$operationName fallida: $errorMessage", e);

      return null;
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
  return 'Ocurrió un error desconocido. Por favor, inténtalo de nuevo más tarde.';
}

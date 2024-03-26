import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../life_cycle_log.dart';

/// A service for displaying snackbars within the application using the GetX framework.
///
/// This service extends `GetxService` and provides a unified approach to show snackbars
/// for different types of messages such as success, error, warning, and informational messages.
/// It utilizes the `Get.snackbar` method from the GetX package to display these messages.
class SnackbarService extends GetxService with LifeCycleLogService {
  @override
  String get logTag => 'SnackbarService';

  /// Displays a success message snackbar.
  ///
  /// [message] - The success message to be shown.
  /// [title] - Optional. The title of the snackbar. Defaults to 'Éxito'.
  void success(String message, {String title = 'Éxito'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Displays an error message snackbar.
  ///
  /// [message] - The error message to be shown.
  /// [title] - Optional. The title of the snackbar. Defaults to 'Error'.
  void error(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Displays a warning message snackbar.
  ///
  /// [message] - The warning message to be shown.
  /// [title] - Optional. The title of the snackbar. Defaults to 'Advertencia'.
  void warning(String message, {String title = 'Advertencia'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Displays an informational message snackbar.
  ///
  /// [message] - The informational message to be shown.
  /// [title] - Optional. The title of the snackbar. Defaults to 'Información'.
  void info(String message, {String title = 'Información'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

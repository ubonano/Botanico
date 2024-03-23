import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// A service for logging within the application, utilizing the `Logger` package for enhanced logging capabilities.
///
/// This service extends `GetxService` and provides a standardized way to log informational, debug, warning,
/// and error messages throughout the app. It is designed to offer a flexible and visually distinct logging output
/// that can be easily integrated into any part of a GetX application.
class LogService extends GetxService {
  /// The internal logger instance configured with custom settings for printing log messages.
  final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // The number of method calls to be displayed.
      errorMethodCount: 8, // The number of method calls if an error is logged.
      lineLength: 120, // The width of the log print.
      colors: true, // Enables colors in console.
      printEmojis: true, // Enables emojis for log levels.
      printTime: false, // Disables printing time.
    ),
  );

  /// Logs an informational message.
  ///
  /// [message] is the information to log.
  void info(String message) => _logger.i(message);

  /// Logs a debug message.
  ///
  /// [message] is the debug information to log.
  void debug(String message) => _logger.d(message);

  /// Logs a warning message.
  ///
  /// [message] is the warning information to log.
  void warning(String message) => _logger.w(message);

  /// Logs an error message along with an optional error object and stack trace.
  ///
  /// [message] is the error information to log.
  /// [error] is an optional error object associated with the error log.
  /// [stackTrace] is an optional stack trace for debugging purposes.
  void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}

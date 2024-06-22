import 'package:logger/logger.dart';

class LogHelper {
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

  void info(String message) => _logger.i(_prependDateTime(message));

  void debug(String message) => _logger.d(_prependDateTime(message));

  void warning(String message) => _logger.w(_prependDateTime(message));

  void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(_prependDateTime(message), error: error, stackTrace: stackTrace);

  String _prependDateTime(String message) {
    var now = DateTime.now();
    var formattedDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    return '$formattedDate - $message';
  }
}

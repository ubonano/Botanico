import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LogService extends GetxService {
  final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  void info(String message) => _logger.i(message);

  void debug(String message) => _logger.d(message);

  void warning(String message) => _logger.w(message);

  void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}

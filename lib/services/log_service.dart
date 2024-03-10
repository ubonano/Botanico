import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LogService extends GetxService {
  final _logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0, // Número de métodos a mostrar
        errorMethodCount: 8, // Número de métodos a mostrar en errores
        lineLength: 120, // Longitud de la línea del log
        colors: true, // Colores en el terminal
        printEmojis: true, // Emojis en el log
        printTime: false // Tiempos en el log
        ),
  );

  void info(String message) => _logger.i(message);

  void debug(String message) => _logger.d(message);

  void warning(String message) => _logger.w(message);

  void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}

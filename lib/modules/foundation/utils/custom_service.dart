import 'package:get/get.dart';

import '../services/loggin_service.dart';

mixin CustomService on GetxService {
  String get logTag;

  final _log = Get.find<LoggingService>();

  @override
  void onInit() {
    super.onInit();

    _log.debug('+ $logTag iniciado');
  }

  @override
  void onClose() {
    _log.debug('- $logTag eliminado');

    super.onClose();
  }
}

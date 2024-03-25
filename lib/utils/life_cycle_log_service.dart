import 'package:get/get.dart';

import 'log_service.dart';

mixin LifeCycleLogService on GetxService {
  String get logTag;

  final _log = Get.find<LogService>();

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

import 'package:get/get.dart';
import 'loggin_service.dart';

mixin LogLifecycleController on GetxController {
  String get logTag;
  final LoggingService _loggingService = Get.find();

  @override
  void onInit() {
    super.onInit();

    _loggingService.logDebug('$logTag iniciado');
  }

  @override
  void onClose() {
    _loggingService.logDebug('$logTag eliminado');

    super.onClose();
  }
}

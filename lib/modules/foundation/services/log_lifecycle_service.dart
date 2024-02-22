import 'package:get/get.dart';
import 'loggin_service.dart';

mixin LogLifecycleService on GetxService {
  String get logTag;
  final LoggingService _loggingService = Get.find();

  @override
  void onInit() {
    super.onInit();

    _loggingService.logInfo('$logTag iniciado');
  }

  @override
  void onClose() {
    _loggingService.logInfo('$logTag eliminado');

    super.onClose();
  }
}

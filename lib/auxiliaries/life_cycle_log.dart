import 'package:get/get.dart';
import 'services/log_service.dart';

mixin LifeCycleLogController on GetxController {
  String get logTag;

  late final LogService _log = Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
    _log.debug('$logTag initiated');
  }

  @override
  void onClose() {
    _log.debug('$logTag destroyed');
    super.onClose();
  }
}

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

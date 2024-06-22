import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

mixin LifeCycleLoggingControllerHelper on GetxController {
  String get logTag;

  late final LogHelper _log = Get.find();

  @override
  void onInit() {
    super.onInit();
    _log.debug('$logTag initiated');
  }

  @override
  void onClose() {
    _log.debug('$logTag destroyed');
    super.onClose();
  }
}

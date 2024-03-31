import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

mixin ContextController on GetxController {
  String get logTag;

  late final LogService _log = Get.find();

  late final OperationManagerService operationManager = Get.find();
  late final AuthService session = Get.find();
  late final SnackbarService snackbar = Get.find();
  late final NavigationController navigate = Get.find();

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

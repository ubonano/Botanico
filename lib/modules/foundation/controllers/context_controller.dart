import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

mixin ContextController on GetxController {
  String get logTag;

  late final LogService _log = Get.find();

  late final OperationManagerService oprManager = Get.find();

  late final AuthRepository authRepo = Get.find();
  late final SnackbarService snackbar = Get.find();
  late final NavigationService navigate = Get.find();

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

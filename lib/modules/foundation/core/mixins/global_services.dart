import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

mixin GlobalServices {
  late final LogService log = Get.find();
  late final NavigationService navigate = Get.find();
  late final OperationManagerService oprManager = Get.find();
  late final SnackbarService snackbar = Get.find();
}

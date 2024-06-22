import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

mixin GlobalHelper {
  late final LogHelper log = Get.find();
  late final NavigationHelper navigate = Get.find();
  late final OperationHelper operation = Get.find();
  late final SnackbarHelper snackbar = Get.find();
}

import 'package:get/get.dart';

import 'log_helper.dart';
import '../../ui/navigation.dart';
import 'operation_helper.dart';
import 'snackbar_helper.dart';

mixin GlobalHelper {
  late final LogHelper log = Get.find();
  late final AppNavigation navigate = Get.find();
  late final OperationHelper operation = Get.find();
  late final SnackbarHelper snackbar = Get.find();
}

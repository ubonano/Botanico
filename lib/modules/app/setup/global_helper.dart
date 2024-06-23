import 'package:get/get.dart';

import '../helpers/log_helper.dart';
import 'navigation.dart';
import '../helpers/operation_helper.dart';
import '../helpers/snackbar_helper.dart';

mixin GlobalHelper {
  late final LogHelper log = Get.find();
  late final NavigationHelper navigate = Get.find();
  late final OperationHelper operation = Get.find();
  late final SnackbarHelper snackbar = Get.find();
}

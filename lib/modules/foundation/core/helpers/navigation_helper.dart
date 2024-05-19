// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/vendor/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../module.dart';

class NavigationHelper
    with AuthenticationNavigateHelper, CompanyNavigationHelper, WorkerNavigationHelper, VendorNavigationHelper {
  late final LogHelper _log = Get.find();

  static const INIT_PAGE = AuthenticationNavigateHelper.SIGN_IN;

  void toHome({bool canPop = false}) => to(Routes.HOME, canPop: canPop);

  @override
  void to(String route, {dynamic arguments, bool canPop = false}) {
    if (canPop) {
      _log.debug('Navigate to named: $route');
      Get.toNamed(route, arguments: arguments);
    } else {
      _log.debug('Navigate off all named: $route');
      Get.offAllNamed(route);
    }
  }

  void back() {
    _log.debug('Navigate - back');
    Get.back();
  }
}

mixin NavigationHelperInstance {
  late final NavigationHelper navigate = Get.find();
}

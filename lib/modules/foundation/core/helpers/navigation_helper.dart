// ignore_for_file: constant_identifier_names

import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/setup/routes.dart';
import 'package:get/get.dart';
import 'log_helper.dart';

class NavigationHelper with AuthenticationNavigationHelper, CompanyNavigationHelper, WorkerNavigationHelper {
  late final LogHelper _log = Get.find();

  static const INIT_PAGE = AuthenticationNavigationHelper.SIGN_IN;

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

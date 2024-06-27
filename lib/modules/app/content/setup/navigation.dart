// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../../accounting_account/content/setup/navigation.dart';
import '../../../authentication/content/setup/navigation.dart';
import '../../../vendor/content/setup/navigation.dart';
import '../../../shipment/content/setup/navigation.dart';
import '../../../worker/content/setup/navigation.dart';
import '../../../company/content/setup/navigation.dart';
import '../helpers/log_helper.dart';

class NavigationHelper
    with
        AuthenticationNavigate,
        CompanyNavigation,
        WorkerNavigation,
        VendorNavigation,
        AccountingAccountNavigation,
        ViaShipmentNavigation {
  late final LogHelper _log = Get.find();

  static const INIT_PAGE = AuthenticationNavigate.SIGN_IN;

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

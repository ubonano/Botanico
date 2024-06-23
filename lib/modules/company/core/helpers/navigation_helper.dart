// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import 'package:botanico/modules/worker/module.dart';

import '../../../accounting_account/setup/navigation.dart';
import '../../../authentication/setup/navigation.dart';
import '../../../vendor/setup/navigation.dart';
import '../../../via_shipment/setup/navigation.dart';

class NavigationHelper
    with
        AuthenticationNavigate,
        CompanyNavigationHelper,
        WorkerNavigationHelper,
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

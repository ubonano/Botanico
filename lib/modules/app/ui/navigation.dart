// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../accounting_account/ui/navigation.dart';
import '../../authentication/content/setup/middlewares.dart';
import '../../authentication/ui/navigation.dart';
import '../../vendor/ui/navigation.dart';
import '../../shipment/ui/navigation.dart';
import '../../worker/ui/middlewares.dart';
import '../../worker/ui/navigation.dart';
import '../../company/ui/navigation.dart';
import 'ui.dart';
import '../content/helpers/log_helper.dart';

class AppNavigation
    with
        AuthenticationNavigate,
        CompanyNavigation,
        WorkerNavigation,
        VendorNavigation,
        AccountingAccountNavigation,
        ShipmentNavigation {
  late final LogHelper _log = Get.find();

  static const INIT_PAGE = AuthenticationNavigate.SIGN_IN;

  static const EMPTY = '/';
  static const HOME = '/home';

  void toHome({bool canPop = false}) => to(HOME, canPop: canPop);

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

final pages = [
  GetPage(
    name: AppNavigation.EMPTY,
    page: () => const HomePage(),
    middlewares: [
      AuthMiddleware(),
      HasWorkerMiddleware(),
      IsEmployedOrOwnerMiddleware(),
    ],
  ),
  GetPage(
    name: AppNavigation.HOME,
    page: () => const HomePage(),
    middlewares: [
      AuthMiddleware(),
      HasWorkerMiddleware(),
      IsEmployedOrOwnerMiddleware(),
    ],
  ),
];

mixin AppNavigationInstance {
  late final AppNavigation navigate = Get.find();
}

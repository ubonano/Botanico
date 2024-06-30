// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../authentication/ui/middlewares.dart';

import '../../authentication/ui/ui.dart';
import '../../worker/ui/middlewares.dart';
import 'ui.dart';
import '../content/helpers/log_helper.dart';

class AppNavigation {
  late final LogHelper _log = Get.find();

  static const INIT_PAGE = SignInPage.route;

  static const EMPTY = '/';
  static const HOME = '/home';

  void toHome({bool canPop = false}) => to(HOME, canPop: canPop);

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

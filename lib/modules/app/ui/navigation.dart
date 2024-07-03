import 'package:get/get.dart';

import '../content/helpers/log_helper.dart';

class AppNavigation {
  late final LogHelper log = Get.find();

  void to(String route, {dynamic arguments, bool canPop = false}) {
    if (canPop) {
      log.debug('Navigate to named: $route');
      Get.toNamed(route, arguments: arguments);
    } else {
      log.debug('Navigate off all named: $route');
      Get.offAllNamed(route);
    }
  }

  void back() {
    log.debug('Navigate - back');
    Get.back();
  }
}

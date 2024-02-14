import 'package:botanico/config/routes.dart';
import 'package:get/get.dart';

class NavigationService {
  void navigateToHome() => navigateTo(Routes.HOME);
  void navigateToLogin() => navigateTo(Routes.LOGIN);
  void navigateToSingUp() => navigateTo(Routes.SIGN_UP);

  void navigateTo(String route) {
    Get.offAllNamed(route);
  }

  void goTo(String route) {
    Get.toNamed(route);
  }

  void goBack() {
    Get.back();
  }
}

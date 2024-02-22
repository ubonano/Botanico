import 'package:botanico/modules/foundation/config/routes.dart';
import 'package:get/get.dart';

class NavigationService {
  void navigateToHome({bool canPop = false}) =>
      navigateTo(Routes.HOME, canPop: canPop);
  void navigateToLogin({bool canPop = false}) =>
      navigateTo(Routes.SIGN_IN, canPop: canPop);
  void navigateToSignUp({bool canPop = false}) =>
      navigateTo(Routes.SIGN_UP, canPop: canPop);
  void navigateToUserProfile({bool canPop = false}) =>
      navigateTo(Routes.USER_PROFILE, canPop: canPop);

  void navigateTo(String route, {bool canPop = false}) {
    if (canPop) {
      Get.toNamed(route);
    } else {
      Get.offAllNamed(route);
    }
  }

  void goBack() => Get.back();
}

import 'package:botanico/modules/foundation/config/routes.dart';
import 'package:get/get.dart';

import 'common_services.dart';

class NavigationService extends GetxService with CommonServices {
  void toHome({bool canPop = false}) => to(Routes.HOME, canPop: canPop);
  void toLobby({bool canPop = false}) => to(Routes.LOBBY, canPop: canPop);
  void toSignIn({bool canPop = false}) => to(Routes.SIGN_IN, canPop: canPop);
  void toSignUp({bool canPop = false}) => to(Routes.SIGN_UP, canPop: canPop);
  void toUserProfile({bool canPop = false}) => to(Routes.USER_PROFILE, canPop: canPop);
  void toCompanyProfile({bool canPop = false}) => to(Routes.COMPANY_PROFILE, canPop: canPop);

  void to(String route, {bool canPop = false}) {
    if (canPop) {
      Get.toNamed(route);
    } else {
      Get.offAllNamed(route);
    }
  }

  void goBack() => Get.back();
}

import 'package:botanico/modules/user_profile/user_profile_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../foundation/config/routes.dart';

class UserProfileMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final UserProfileService userProfileService = Get.find();

    if (!userProfileService.isUserProfile) {
      return const RouteSettings(name: Routes.USER_PROFILE);
    }

    return null;
  }
}

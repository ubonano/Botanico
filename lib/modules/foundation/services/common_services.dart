import 'package:botanico/modules/auth/auth_service.dart';
import 'package:botanico/modules/foundation/services/async_operation_service.dart';
import 'package:botanico/modules/user_profile/user_profile_service.dart';

import 'package:get/get.dart';

import 'loggin_service.dart';
import 'navigation_service.dart';

mixin CommonServices {
  late final NavigationService navigationService = Get.find();
  late final LoggingService loggingService = Get.find();
  late final AsyncOperationService asyncOperationService = Get.find();

  late final AuthService authService = Get.find();
  late final UserProfileService userProfileService = Get.find();
}

import 'package:get/get.dart';
import '../../auth/auth_service.dart';
import '../../company_profile/company_profile_service.dart';
import '../../user_profile/user_profile_service.dart';
import 'async_operation_service.dart';
import 'loggin_service.dart';
import 'navigation_service.dart';

mixin CommonServices {
  late final NavigationService navigationService = Get.find();
  late final LoggingService loggingService = Get.find();
  late final AsyncOperationService asyncOperationService = Get.find();

  late final AuthService authService = Get.find();
  late final UserProfileService userProfileService = Get.find();
  late final CompanyProfileService companyProfileService = Get.find();
}

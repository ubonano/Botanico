import 'package:botanico/modules/company_profile/company_profile_model.dart';
import 'package:botanico/modules/user_profile/user_profile_model.dart';
import 'package:get/get.dart';
import '../../auth/auth_service.dart';
import '../../company_profile/company_profile_service.dart';
import '../../user_profile/user_profile_service.dart';
import '../services/async_operation_service.dart';
import '../services/loggin_service.dart';
import '../services/navigation_service.dart';

mixin CustomController on GetxController {
  String get logTag;

  late final log = Get.find<LoggingService>();
  late final navigate = Get.find<NavigationService>();
  late final async = Get.find<AsyncOperationService>();

  late final auth = Get.find<AuthService>();
  late final userProfileService = Get.find<UserProfileService>();
  late final companyProfileService = Get.find<CompanyProfileService>();

  String get loggedUserUID => auth.user!.uid;
  String get loggedUserEmail => auth.user!.email!;

  UserProfileModel? get userProfile => userProfileService.userProfile$.value;
  bool get isUserProfileLoaded => userProfile != null;
  bool get userHasCompany => userProfile!.companyUid != '';

  CompanyProfileModel? get company => companyProfileService.companyProfile$.value;
  bool get isCompanyLoaded => company != null;

  Future<void> fetchUserProfile() async => await userProfileService.fetchById(loggedUserUID);
  Future<void> fetchCompany() async => await companyProfileService.fetchById(userProfile!.companyUid);

  void cleanData() {
    cleanUserProfile();
    cleanCompany();
  }

  void cleanCompany() => companyProfileService.clean();
  void cleanUserProfile() => userProfileService.clean();

  @override
  void onInit() {
    super.onInit();

    log.debug('+ $logTag iniciado');
  }

  @override
  void onClose() {
    log.debug('- $logTag eliminado');

    super.onClose();
  }
}

import 'package:botanico/modules/company/company_model.dart';
import 'package:botanico/modules/auth/models/profile_model.dart';
import 'package:get/get.dart';
import '../../auth/services/auth_service.dart';
import '../../company/company_service.dart';
import '../../auth/services/profile_service.dart';
import '../services/async_operation_service.dart';
import '../services/loggin_service.dart';
import '../services/navigation_service.dart';

mixin CustomController on GetxController {
  String get logTag;

  late final log = Get.find<LoggingService>();
  late final navigate = Get.find<NavigationService>();
  late final async = Get.find<AsyncOperationService>();

  late final auth = Get.find<AuthService>();
  late final profileService = Get.find<ProfileService>();
  late final companyService = Get.find<CompanyService>();

  String get loggedUserUID => auth.user!.uid;
  String get loggedUserEmail => auth.user!.email!;

  ProfileModel? get profile => profileService.profile$.value;
  bool get isProfileLoaded => profile != null;

  CompanyModel? get company => companyService.company$.value;
  bool get isCompanyLoaded => company != null;

  Future<void> fetchProfile() async => await profileService.fetch(loggedUserUID);
  Future<void> fetchCompany() async => await companyService.fetchByOwnerId(loggedUserUID);

  void cleanData() {
    cleanProfile();
    cleanCompany();
  }

  void cleanCompany() => companyService.clean();
  void cleanProfile() => profileService.clean();

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

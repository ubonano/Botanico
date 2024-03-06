import 'package:botanico/modules/company/company_model.dart';
import 'package:botanico/modules/auth/user_model.dart';
import 'package:get/get.dart';
import '../../auth/services/auth_service.dart';
import '../../company/company_service.dart';
import '../../auth/services/user_service.dart';
import '../services/async_operation_service.dart';
import '../services/loggin_service.dart';
import '../services/navigation_service.dart';

mixin CustomController on GetxController {
  String get logTag;

  late final log = Get.find<LoggingService>();
  late final navigate = Get.find<NavigationService>();
  late final async = Get.find<AsyncOperationService>();

  late final auth = Get.find<AuthService>();
  late final userService = Get.find<UserService>();
  late final companyService = Get.find<CompanyService>();

  String get loggedUserUID => auth.user!.uid;
  String get loggedUserEmail => auth.user!.email!;

  UserModel? get user => userService.user$.value;
  bool get isUserLoaded => user != null;

  CompanyModel? get company => companyService.company$.value;
  bool get isCompanyLoaded => company != null;

  Future<void> fetchUser() async => await userService.fetchById(loggedUserUID);
  Future<void> fetchCompany() async => await companyService.fetchByOwnerId(loggedUserUID);

  void cleanData() {
    cleanUser();
    cleanCompany();
  }

  void cleanCompany() => companyService.clean();
  void cleanUser() => userService.clean();

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

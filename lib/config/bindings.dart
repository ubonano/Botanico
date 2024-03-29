import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    _setupFirebaseInstances();
    _setupRepositories();
    _setupCommonServices();
    _setupBusinessServices();
    _setupControllers();
  }

  void _setupFirebaseInstances() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance, permanent: true);
  }

  void _setupRepositories() {
    Get.lazyPut<CompanyRepository>(() => CompanyRepository(), fenix: true);
    Get.lazyPut<WorkerRepository>(() => WorkerRepository(), fenix: true);
  }

  void _setupCommonServices() {
    Get.put(LogService(), permanent: true);
    Get.put(SnackbarService(), permanent: true);
    Get.put(OperationManagerService(), permanent: true);
    Get.put(NavigationService(), permanent: true);
  }

  void _setupBusinessServices() {
    Get.lazyPut<AuthService>(() => AuthService(), fenix: true);
    Get.lazyPut<WorkerService>(() => WorkerService(), fenix: true);
    Get.lazyPut<CompanyService>(() => CompanyService(), fenix: true);
    Get.lazyPut<PermissionModuleService>(() => PermissionModuleService(), fenix: true);
  }

  void _setupControllers() {
    Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
    Get.lazyPut<WorkerLobbyController>(() => WorkerLobbyController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

    Get.lazyPut<SessionService>(() => SessionService(), fenix: true);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
    Get.lazyPut<RecoverPasswordController>(() => RecoverPasswordController(), fenix: true);

    Get.lazyPut<CompanyCreateController>(() => CompanyCreateController(), fenix: true);
    Get.lazyPut<WorkerCreateController>(() => WorkerCreateController(), fenix: true);
    Get.lazyPut<WorkerListController>(() => WorkerListController(), fenix: true);
    Get.lazyPut<WorkerLinkingController>(() => WorkerLinkingController(), fenix: true);
    Get.lazyPut<WorkerLinkingController>(() => WorkerLinkingController(), fenix: true);
    Get.lazyPut<WorkerUnlinkingController>(() => WorkerUnlinkingController(), fenix: true);
    Get.lazyPut<WorkerManagementPermissionsController>(() => WorkerManagementPermissionsController(), fenix: true);
  }
}

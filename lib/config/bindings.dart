import 'package:botanico/modules/authentication/services/session_service.dart';
import 'package:botanico/modules/worker/ui/link_worker/link_worker_controller.dart';
import 'package:botanico/modules/authentication/ui/recover_password/recover_password_controller.dart';
import 'package:botanico/modules/authentication/ui/sign_in/sign_in_controller.dart';
import 'package:botanico/modules/authentication/ui/sign_up/sign_up_controller.dart';
import 'package:botanico/modules/worker/ui/worker_create/worker_create_controller.dart';
import 'package:botanico/modules/company/ui/company_create/company_create_controller.dart';
import 'package:botanico/modules/worker/ui/linked_workers/linked_workers_controller.dart';
import 'package:botanico/modules/worker/ui/worker_management_permissions/worker_management_permissions_controller.dart';
import 'package:botanico/modules/company/company_service.dart';
import 'package:botanico/modules/worker/services/linked_worker_service.dart';
import 'package:botanico/auxiliaries/services/log_service.dart';
import 'package:botanico/auxiliaries/services/snackbar_service.dart';
import 'package:botanico/ui/widgets/custom_drawer/custom_drawer_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../modules/authentication/services/auth_service.dart';
import '../auxiliaries/services/permission_module_service.dart';
import '../modules/worker/services/worker_service.dart';
import '../modules/authentication/ui/sign_out_button/sign_out_controller.dart';
import '../ui/home/home_controller.dart';
import '../modules/worker/ui/lobby/lobby_controller.dart';
import '../auxiliaries/services/async_operation_service.dart';
import '../auxiliaries/services/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    _setupFirebaseInstances();
    _setupCommonServices();
    _setupBusinessServices();
    _setupControllers();
  }

  void _setupFirebaseInstances() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance, permanent: true);
  }

  void _setupCommonServices() {
    Get.put(LogService(), permanent: true);
    Get.put(SnackbarService(), permanent: true);
    Get.put(AsyncOperationService(), permanent: true);
    Get.put(NavigationService(log: Get.find()), permanent: true);
  }

  void _setupBusinessServices() {
    Get.lazyPut<AuthService>(() => AuthService(), fenix: true);
    Get.lazyPut<WorkerService>(() => WorkerService(), fenix: true);
    Get.lazyPut<CompanyService>(() => CompanyService(), fenix: true);
    Get.lazyPut<LinkedWorkerService>(() => LinkedWorkerService(), fenix: true);
    Get.lazyPut<PermissionModuleService>(() => PermissionModuleService(), fenix: true);
  }

  void _setupControllers() {
    Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
    Get.lazyPut<LobbyController>(() => LobbyController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

    Get.lazyPut<SessionService>(() => SessionService(), fenix: true);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
    Get.lazyPut<RecoverPasswordController>(() => RecoverPasswordController(), fenix: true);

    Get.lazyPut<CompanyCreateController>(() => CompanyCreateController(), fenix: true);
    Get.lazyPut<WorkerCreateController>(() => WorkerCreateController(), fenix: true);
    Get.lazyPut<LinkedWorkersController>(() => LinkedWorkersController(), fenix: true);
    Get.lazyPut<LinkWorkerController>(() => LinkWorkerController(), fenix: true);
    Get.lazyPut<WorkerManagementPermissionsController>(() => WorkerManagementPermissionsController(), fenix: true);
  }
}

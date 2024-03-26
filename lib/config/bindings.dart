import 'package:botanico/controllers/session_controller.dart';
import 'package:botanico/pages/link_worker/link_worker_controller.dart';
import 'package:botanico/pages/recover_password/recover_password_controller.dart';
import 'package:botanico/pages/sign_in/sign_in_controller.dart';
import 'package:botanico/pages/sign_up/sign_up_controller.dart';
import 'package:botanico/pages/worker_create/worker_create_controller.dart';
import 'package:botanico/pages/company_create/company_create_controller.dart';
import 'package:botanico/pages/linked_workers/linked_workers_controller.dart';
import 'package:botanico/pages/worker_permissions/worker_permissions_controller.dart';
import 'package:botanico/services/company_service.dart';
import 'package:botanico/services/linked_worker_service.dart';
import 'package:botanico/services/log_service.dart';
import 'package:botanico/services/snackbar_service.dart';
import 'package:botanico/widgets/custom_drawer/custom_drawer_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';
import '../services/module_service.dart';
import '../services/worker_service.dart';
import '../widgets/sign_out_button/sign_out_controller.dart';
import '../pages/home/home_controller.dart';
import '../pages/lobby/lobby_controller.dart';
import '../services/async_operation_service.dart';
import '../services/navigation_service.dart';

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
    Get.put(SnackbarService(), permanent: true);
    Get.put(LogService(), permanent: true);
    Get.put(AsyncOperationService(), permanent: true);
    Get.put(NavigationService(log: Get.find()), permanent: true);
  }

  void _setupBusinessServices() {
    Get.lazyPut<AuthService>(() => AuthService(), fenix: true);
    Get.lazyPut<WorkerService>(() => WorkerService(), fenix: true);
    Get.lazyPut<CompanyService>(() => CompanyService(), fenix: true);
    Get.lazyPut<LinkedWorkerService>(() => LinkedWorkerService(), fenix: true);
    Get.lazyPut<ModuleService>(() => ModuleService(), fenix: true);
  }

  void _setupControllers() {
    Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
    Get.lazyPut<LobbyController>(() => LobbyController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

    Get.lazyPut<SessionController>(() => SessionController(), fenix: true);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
    Get.lazyPut<RecoverPasswordController>(() => RecoverPasswordController(), fenix: true);

    Get.lazyPut<CompanyCreateController>(() => CompanyCreateController(), fenix: true);
    Get.lazyPut<WorkerCreateController>(() => WorkerCreateController(), fenix: true);
    Get.lazyPut<LinkedWorkersController>(() => LinkedWorkersController(), fenix: true);
    Get.lazyPut<LinkWorkerController>(() => LinkWorkerController(), fenix: true);
    Get.lazyPut<PermissionsController>(() => PermissionsController(), fenix: true);
  }
}

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

// TODO refactorizar para que se instancie cada una en su modulo y aca se llame esa instanciacion
class AppBindings extends Bindings {
  @override
  void dependencies() {
    authenticationDependencies();
    _setupRepositories();

    _setupCommonServices();
    _setupBusinessServices();
    _setupControllers();
  }

  void _setupRepositories() {
    Get.lazyPut<CompanyRepository>(() => CompanyRepository(), fenix: true);
    Get.lazyPut<WorkerRepository>(() => WorkerRepository(), fenix: true);
  }

  void _setupCommonServices() {
    Get.put(NavigationService(), permanent: true);
    Get.put(LogService(), permanent: true);
    Get.put(SnackbarService(), permanent: true);
    Get.put(OperationManagerService(), permanent: true);
  }

  void _setupBusinessServices() {
    Get.lazyPut<PermissionModuleService>(() => PermissionModuleService(), fenix: true);
  }

  void _setupControllers() {
    Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
    Get.lazyPut<WorkerLobbyController>(() => WorkerLobbyController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

    Get.lazyPut<CompanyCreateController>(() => CompanyCreateController(), fenix: true);
    Get.lazyPut<WorkerCreateController>(() => WorkerCreateController(), fenix: true);
    Get.lazyPut<WorkerListController>(() => WorkerListController(), fenix: true);
    Get.lazyPut<WorkerLinkingController>(() => WorkerLinkingController(), fenix: true);
    Get.lazyPut<WorkerLinkingController>(() => WorkerLinkingController(), fenix: true);
    Get.lazyPut<WorkerUnlinkingController>(() => WorkerUnlinkingController(), fenix: true);
    Get.lazyPut<WorkerManagementPermissionsController>(() => WorkerManagementPermissionsController(), fenix: true);
  }
}

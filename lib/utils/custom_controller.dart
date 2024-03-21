import 'package:botanico/models/company_model.dart';
import 'package:botanico/models/worker_model.dart';
import 'package:botanico/utils/snackbar_service.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../services/company_service.dart';
import '../services/worker_service.dart';
import 'async_operation_service.dart';
import 'log_service.dart';
import '../services/navigation_service.dart';

mixin CustomController on GetxController {
  String get logTag;

  late final log = Get.find<LogService>();
  late final navigate = Get.find<NavigationService>();
  late final async = Get.find<AsyncOperationService>();
  late final snackbar = Get.find<SnackbarService>();

  late final auth = Get.find<AuthService>();
  late final workerService = Get.find<WorkerService>();
  late final companyService = Get.find<CompanyService>();

  bool get isLoggedInUser => auth.user != null;
  String get loggedUserUID => auth.user?.uid ?? '';
  String get loggedUserEmail => auth.user?.email ?? '';

  WorkerModel? get currentWorker => workerService.worker$.value;
  String get currentWorkerId => currentWorker?.uid ?? '';
  bool get currentWorkerIsLoaded => currentWorker != null;
  bool get currentWorkerHasCompany => currentWorkerIsLoaded && currentWorker!.companyId != '';

  CompanyModel? get currentCompany => companyService.company$.value;
  String get currentCompanyId => currentCompany?.uid ?? '';
  bool get currentCompanyIsLoaded => currentCompany != null;

  Future<void> fetchWorker() async {
    await workerService.fetch(loggedUserUID);
  }

  Future<void> fetchCompany() async {
    await companyService.fetch(currentWorker!.companyId);
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    if (isLoggedInUser && !currentWorkerIsLoaded) await fetchWorker();
    if (currentWorkerHasCompany && !currentCompanyIsLoaded) await fetchCompany();

    log.debug('+ $logTag iniciado');
  }

  @override
  void onClose() {
    log.debug('- $logTag eliminado');

    super.onClose();
  }
}

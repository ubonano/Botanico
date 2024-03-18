import 'package:botanico/models/company_model.dart';
import 'package:botanico/models/worker_model.dart';
import 'package:get/get.dart';
import 'auth_service.dart';
import 'company_service.dart';
import 'worker_service.dart';
import '../utils/async_operation_service.dart';
import '../utils/log_service.dart';
import 'navigation_service.dart';

mixin CustomController on GetxController {
  String get logTag;

  late final log = Get.find<LogService>();
  late final navigate = Get.find<NavigationService>();
  late final async = Get.find<AsyncOperationService>();

  late final auth = Get.find<AuthService>();
  late final workerService = Get.find<WorkerService>();
  late final companyService = Get.find<CompanyService>();

  bool get isLoggedInUser => auth.user != null;
  String get loggedUserUID => auth.user?.uid ?? '';
  String get loggedUserEmail => auth.user?.email ?? '';

  WorkerModel? get loggedInWorker => workerService.worker$.value;
  String get loggedInWorkerId => loggedInWorker?.uid ?? '';
  bool get loggedInWorkerIsLoaded => loggedInWorker != null;
  bool get loggedInWorkerHasCompany => loggedInWorkerIsLoaded && loggedInWorker!.companyId != '';

  CompanyModel? get loggedIncompany => companyService.company$.value;
  String get loggedInCompanyId => loggedIncompany?.uid ?? '';
  bool get loggedInCompanyIsLoaded => loggedIncompany != null;

  Future<void> fetchWorker() async {
    if (isLoggedInUser) await workerService.fetch(loggedUserUID);
  }

  Future<void> fetchCompany() async {
    if (loggedInWorkerHasCompany) await companyService.fetch(loggedInWorker!.companyId);
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    await fetchWorker();
    await fetchCompany();

    log.debug('+ $logTag iniciado');
  }

  @override
  void onClose() {
    log.debug('- $logTag eliminado');

    super.onClose();
  }
}

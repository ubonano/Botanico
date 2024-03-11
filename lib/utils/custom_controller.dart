import 'package:botanico/models/company_model.dart';
import 'package:botanico/models/worker_model.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../services/company_service.dart';
import '../services/worker_service.dart';
import 'async_operation_service.dart';
import 'log_service.dart';
import 'navigation_service.dart';

mixin CustomController on GetxController {
  String get logTag;

  late final log = Get.find<LogService>();
  late final navigate = Get.find<NavigationService>();
  late final async = Get.find<AsyncOperationService>();

  late final auth = Get.find<AuthService>();
  late final workerService = Get.find<WorkerService>();
  late final companyService = Get.find<CompanyService>();

  String get loggedUserUID => auth.user!.uid;
  String get loggedUserEmail => auth.user!.email!;

  WorkerModel? get worker => workerService.worker$.value;
  bool get isWorkerLoaded => worker != null;
  bool get workerHasCompany => isWorkerLoaded && worker!.companyId != '';

  CompanyModel? get company => companyService.company$.value;
  bool get isCompanyLoaded => company != null;

  Future<void> fetchWorker() async => await workerService.fetch(loggedUserUID);
  Future<void> fetchCompany() async {
    if (workerHasCompany) {
      await companyService.fetch(worker!.companyId);
    }
  }

  void cleanData() {
    cleanWorker();
    cleanCompany();
  }

  void cleanCompany() => companyService.clean();
  void cleanWorker() => workerService.clean();

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

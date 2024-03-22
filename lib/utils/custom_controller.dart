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

/// A mixin providing a set of common functionalities for controllers within the application.
///
/// This mixin centralizes common services such as authentication, navigation, logging, and snackbar notifications,
/// along with providing access to specific models like the current user, worker, and company.
/// It's designed to be used with GetX controllers to enhance reusability and maintain a clean architecture.
mixin CustomController on GetxController {
  /// A unique identifier for the controller for logging purposes.
  String get logTag;

  // Service instances
  late final LogService log = Get.find();
  late final NavigationService navigate = Get.find();
  late final AsyncOperationService async = Get.find();
  late final SnackbarService snackbar = Get.find();

  late final AuthService auth = Get.find();
  late final WorkerService workerService = Get.find();
  late final CompanyService companyService = Get.find();

  /// Checks if a user is currently logged in.
  bool get isLoggedInUser => auth.user != null;

  /// Retrieves the current user's UID. Returns an empty string if no user is logged in.
  String get currentUserUID => auth.user?.uid ?? '';

  /// Retrieves the current user's email. Returns an empty string if no user is logged in.
  String get currentUserEmail => auth.user?.email ?? '';

  /// Retrieves the current worker model from the observable in the WorkerService.
  WorkerModel? get currentWorker => workerService.worker$.value;

  /// Retrieves the current worker's UID.
  String get currentWorkerId => currentWorker?.uid ?? '';

  /// Checks if the current worker model is loaded.
  bool get currentWorkerIsLoaded => currentWorker != null;

  /// Checks if the current worker is associated with a company.
  bool get currentWorkerHasCompany => currentWorkerIsLoaded && currentWorker!.companyId != '';

  /// Retrieves the current company model from the observable in the CompanyService.
  CompanyModel? get currentCompany => companyService.company$.value;

  /// Retrieves the current company's UID.
  String get currentCompanyId => currentCompany?.uid ?? '';

  /// Checks if the current company model is loaded.
  bool get currentCompanyIsLoaded => currentCompany != null;

  /// Fetches the worker model based on the current user's UID.
  Future<void> fetchWorker() async => await workerService.fetch(currentUserUID);

  /// Fetches the company model based on the current worker's company ID.
  Future<void> fetchCompany() async => await companyService.fetch(currentWorker!.companyId);

  @override
  Future<void> onInit() async {
    super.onInit();
    // Initial setup to fetch worker and company information if available
    if (isLoggedInUser && !currentWorkerIsLoaded) await fetchWorker();
    if (currentWorkerHasCompany && !currentCompanyIsLoaded) await fetchCompany();

    log.debug('+ $logTag initiated');
  }

  @override
  void onClose() {
    // Cleanup and logging on controller close
    log.debug('- $logTag destroyed');
    super.onClose();
  }
}

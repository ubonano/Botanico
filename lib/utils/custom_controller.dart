import 'package:botanico/models/company_model.dart';
import 'package:botanico/models/worker_model.dart';
import 'package:botanico/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../services/company_service.dart';
import '../services/worker_service.dart';
import 'async_operation_service.dart';
import 'log_service.dart';
import '../services/navigation_service.dart';

mixin CustomController on GetxController {
  String get logTag;

  late Map<String, TextEditingController> textControllers = {};

  late final LogService log = Get.find();
  late final NavigationService navigate = Get.find();
  late final AsyncOperationService async = Get.find();
  late final SnackbarService snackbar = Get.find();

  late final AuthService auth = Get.find();
  late final WorkerService workerService = Get.find();
  late final CompanyService companyService = Get.find();

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

  String getFieldValue(String field) => textControllers[field]!.text.trim();
  String setFieldValue(String field, dynamic value) => textControllers[field]!.text = field;
  TextEditingController? getFieldController(String field) => textControllers[field];

  Future<void> fetchWorker() async => await workerService.fetch(loggedUserUID);
  Future<void> fetchCompany() async => await companyService.fetch(currentWorker!.companyId);

  @override
  Future<void> onInit() async {
    super.onInit();

    if (isLoggedInUser && !currentWorkerIsLoaded) await fetchWorker();
    if (currentWorkerHasCompany && !currentCompanyIsLoaded) await fetchCompany();

    log.debug('+ $logTag iniciado');
  }

  @override
  void onClose() {
    if (textControllers.isNotEmpty) disposeControllers();

    log.debug('- $logTag eliminado');

    super.onClose();
  }

  // ignore: avoid_function_literals_in_foreach_calls
  void disposeControllers() => textControllers.values.forEach((controller) => controller.dispose());
}

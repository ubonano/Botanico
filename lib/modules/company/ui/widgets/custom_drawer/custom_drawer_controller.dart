import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../../module.dart';

class CustomDrawerController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'CustomDrawerController';

  late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  WorkerModel? get currentWorker$ => _workerBusinessLogic.loggedWorker$;
  CompanyModel? get currentCompany$ => _companyBusinessLogic.currentCompany$;

  @override
  Future<void> onInit() async {
    super.onInit();

    await _workerBusinessLogic.fetchLoggedWorker();
    await _companyBusinessLogic.fetchLoggedCompany();
  }
}

import 'package:get/get.dart';

import '../../../worker/setup/interfaces/i_worker_business_logic.dart';
import '../../helpers/life_cycle_logging_controller_helper.dart';
import '../../../company/setup/interfaces/i_company_business_logic.dart';

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

import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'CustomDrawerController';

  late final WorkerHandler _workerHandler = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  WorkerModel? get currentWorker$ => _workerHandler.loggedWorker$;
  CompanyModel? get currentCompany$ => _companyBusinessLogic.currentCompany$;

  @override
  Future<void> onInit() async {
    super.onInit();

    // TODO ver que si no se hace aca, no se muestra... cuando en el signIn o signUp ya se hace un fetch...
    await _workerHandler.fetchLoggedWorker();
    await _companyBusinessLogic.get(_workerHandler.loggedWorker$!.companyId);
  }
}

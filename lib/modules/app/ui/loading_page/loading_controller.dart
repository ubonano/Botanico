import 'package:get/get.dart';

import '../../../company/setup/interfaces/i_company_service.dart';
import '../../../worker/content/setup/interfaces/i_worker_service.dart';
import '../../../worker/ui/ui.dart';
import '../../content/helpers/life_cycle_logging_controller_helper.dart';
import '../ui.dart';

class LoadingController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'LoadingController';

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> fetchCurrentWorker() async {
    final worker = await Get.find<IWorkerService>().fetchCurrentWorker();
    await Get.find<ICompanyService>().fetchLoggedCompany();

    if (worker == null) {
      WorkerFormPage.navigate();
    } else {
      HomePage.navigate();
    }
  }
}

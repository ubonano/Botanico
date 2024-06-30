import 'package:get/get.dart';

import '../../../../app/content/helpers/global_helper.dart';
import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../../company/content/setup/interfaces/i_company_service.dart';
import '../../../../worker/content/setup/interfaces/i_worker_service.dart';
import '../../../setup/interfaces/i_authentication_service.dart';
import '../../ui.dart';

class SignOutController extends GetxController with GlobalHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'SignOutController';

  late final IAuthenticationService _authService = Get.find();
  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  Future<void> signOut() async {
    try {
      await _authService.signOut();

      _workerService.clearCurrentWorker();
      _companyService.clearCurrentCompany();

      SignInPage.navigate();
    } catch (e) {
      logTag;
    }
  }
}

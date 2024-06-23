import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../worker/setup/interfaces/i_worker_service.dart';
import '../../setup/interfaces/i_authentication_service.dart';

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

      navigate.toSignIn();
    } catch (e) {
      logTag;
    }
  }
}

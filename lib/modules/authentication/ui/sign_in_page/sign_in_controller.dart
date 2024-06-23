import 'package:botanico/modules/company/module.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../setup/interfaces/i_authentication_service.dart';

class SignInController extends GetxController with GlobalHelper, FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'SignInController';

  late final IAuthenticationService _authService = Get.find();
  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password];

  @override
  Future<void> submit() async {
    try {
      await _authService.signIn(
        getFieldValue(FieldKeys.email),
        getFieldValue(FieldKeys.password),
      );

      await redirect();
    } catch (e) {
      logTag;
    }
  }

  Future<void> redirect() async {
    WorkerModel? worker = await _workerService.fetchLoggedWorker();

    if (worker == null) {
      navigate.toWorkerCreate();
      return;
    }

    CompanyModel? company = await _companyService.fetchLoggedCompany();

    if (company != null) {
      navigate.toHome();
    } else {
      navigate.toLobby();
    }
  }
}

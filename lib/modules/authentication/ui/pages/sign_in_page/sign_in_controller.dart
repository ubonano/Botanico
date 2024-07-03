import 'package:get/get.dart';

import '../../../../app/content/setup/fields_key.dart';
import '../../../../app/content/helpers/form_helper.dart';
import '../../../../app/content/helpers/global_helper.dart';
import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../../app/ui/ui.dart';
import '../../../../company/setup/interfaces/i_company_service.dart';
import '../../../../worker/content/setup/interfaces/i_worker_service.dart';
import '../../../../worker/ui/ui.dart';
import '../../../setup/interfaces/i_authentication_service.dart';

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
    print('Debug: Antes de obtener el trabajador');
    WorkerModel? worker = await _workerService.fetchCurrentWorker();
    print('Debug: Trabajador obtenido: $worker');

    if (worker == null) {
      print('Debug: Trabajador nulo, navegando a WorkerFormPage');
      WorkerFormPage.navigate();
      return;
    }

    print('Debug: Antes de obtener la compañía');
    CompanyModel? company = await _companyService.fetchCurrentCompany();
    print('Debug: Compañía obtenida: $company');

    if (company != null) {
      print('Debug: Compañía encontrada, navegando a HomePage');
      HomePage.navigate();
    } else {
      print('Debug: Compañía nula, navegando a LobbyPage');
      LobbyPage.navigate();
    }
  }
}

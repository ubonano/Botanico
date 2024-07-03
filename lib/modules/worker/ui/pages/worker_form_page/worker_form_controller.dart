import 'package:botanico/modules/worker/ui/ui.dart';
import 'package:get/get.dart';

import '../../../../app/content/setup/fields_key.dart';
import '../../../../app/content/helpers/form_helper.dart';
import '../../../../app/content/helpers/global_helper.dart';
import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../content/setup/interfaces/i_worker_service.dart';

class WorkerFormController extends GetxController
    with GlobalHelper, FormHelper<WorkerModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerFormController';

  late final IWorkerService _workerService = Get.find();

  @override
  List<String> formFields = [FieldKeys.fullname, FieldKeys.birthDate, FieldKeys.phone, FieldKeys.dni];

  @override
  Future<void> submit() async {
    try {
      await _workerService.create(buildModel());
      await _workerService.fetchCurrentWorker();

      LobbyPage.navigate();
    } catch (e) {
      logTag;
    }
  }

  @override
  WorkerModel buildModel() => WorkerModel(
        name: getFieldValue(FieldKeys.fullname),
        birthDate: getFieldValue(FieldKeys.birthDate),
        phone: getFieldValue(FieldKeys.phone),
        dni: getFieldValue(FieldKeys.dni),
      );
}

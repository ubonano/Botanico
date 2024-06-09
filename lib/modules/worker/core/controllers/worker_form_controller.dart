import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

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
      await _workerService.createWorker(buildModel());
      await _workerService.fetchLoggedWorker();
      navigate.toLobby();
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

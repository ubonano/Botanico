import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class WorkerCreateController extends GetxController with FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerCreateController';

  late final IWorkerService _workerService = Get.find();

  @override
  List<String> formFields = [FieldKeys.fullname, FieldKeys.birthDate, FieldKeys.phone, FieldKeys.dni];

  @override
  Future<void> submit() async => await _workerService.createWorker(_worker);

  WorkerModel get _worker => WorkerModel(
        name: getFieldValue(FieldKeys.fullname),
        birthDate: getFieldValue(FieldKeys.birthDate),
        phone: getFieldValue(FieldKeys.phone),
        dni: getFieldValue(FieldKeys.dni),
      );
}

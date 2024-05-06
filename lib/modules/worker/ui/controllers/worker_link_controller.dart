import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

import '../../worker_module.dart';

class WorkerLinkController extends GetxController with FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerLinkController';

  late final IWorkerService _workerService = Get.find();

  @override
  List<String> formFields = [FieldKeys.uid];

  @override
  Future<void> submit() async => await _workerService.linkWorker(getFieldValue(FieldKeys.uid));
}

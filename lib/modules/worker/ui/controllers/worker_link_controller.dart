import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class WorkerLinkController extends GetxController with FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerLinkController';

  late final IWorkerService _workerService = Get.find();

  @override
  List<String> formFields = [FieldKeys.uid];

  @override
  Future<void> submit() async => await _workerService.linkWorker(getFieldValue(FieldKeys.uid));
}

import 'package:get/get.dart';

import '../../../company/helpers/fields_key.dart';
import '../../../company/helpers/form_helper.dart';
import '../../../company/helpers/global_helper.dart';
import '../../../company/helpers/life_cycle_logging_controller_helper.dart';
import '../../setup/interfaces/i_worker_service.dart';

class WorkerLinkController extends GetxController with GlobalHelper, FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerLinkController';

  late final IWorkerService _workerService = Get.find();

  @override
  List<String> formFields = [FieldKeys.uid];

  @override
  Future<void> submit() async {
    try {
      await _workerService.link(getFieldValue(FieldKeys.uid));

      navigate.back();
    } catch (e) {
      logTag;
    }
  }
}

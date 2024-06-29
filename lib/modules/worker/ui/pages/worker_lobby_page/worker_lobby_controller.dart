import 'package:get/get.dart';

import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../content/setup/interfaces/i_worker_service.dart';

class WorkerLobbyController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerLobbyController';

  late final IWorkerService _workerService = Get.find();

  String get uid => _workerService.currentWorker$?.uid ?? '';
}

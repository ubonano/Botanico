import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../setup/interfaces/i_worker_service.dart';

class WorkerLobbyController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerLobbyController';

  late final IWorkerService _workerService = Get.find();

  String get uid => _workerService.loggedWorker$?.uid ?? '';
}

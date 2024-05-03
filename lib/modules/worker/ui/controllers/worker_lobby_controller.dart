import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerLobbyController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerLobbyController';

  late final WorkerService _workerService = Get.find();

  String get uid => _workerService.loggedWorker$?.uid ?? '';
}

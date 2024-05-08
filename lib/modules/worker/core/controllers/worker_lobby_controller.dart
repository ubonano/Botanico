import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerLobbyController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerLobbyController';

  late final IWorkerService _workerService = Get.find();

  String get uid => _workerService.loggedWorker$?.uid ?? '';
}

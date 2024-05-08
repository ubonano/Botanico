import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerUnlinkingController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerUnlinkingController';

  late final IWorkerService _workerService = Get.find();

  Future<void> submit(WorkerModel worker) async => await _workerService.unlinkWorker(worker.uid);
}

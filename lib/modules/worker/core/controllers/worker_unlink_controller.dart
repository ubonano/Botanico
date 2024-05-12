import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class WorkerUnlinkController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerUnlinkController';

  late final IWorkerService _workerService = Get.find();

  Future<void> submit(WorkerModel worker) async => await _workerService.unlinkWorker(worker.uid);
}

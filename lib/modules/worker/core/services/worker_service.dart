import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerService with GlobalServices, WorkerContext {
  late final WorkerHandler _workerHandler = Get.find();

  Future<void> createWorker(WorkerModel worker) async {
    await oprManager.perform(
      operationName: 'Create worker',
      operation: (_) async => await _workerHandler.createWorker(worker),
      onSuccess: _workerHandler.postCreateWorker,
    );
  }
}

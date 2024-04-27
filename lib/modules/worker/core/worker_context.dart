import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

mixin WorkerContext {
  late final WorkerRepository workerRepo = Get.find();

  Future<WorkerModel?> getWorker(String id) async => await workerRepo.fetch(id);

  void cleanCurrentWorker() => workerRepo.clearCurrentWorker();
}

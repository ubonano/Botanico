import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class LinkedWorkersController extends GetxController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'LinkedWorkersController';

  late final WorkerService _workerService = Get.find();

  RxList<LinkedWorkerModel> get list$ => _workerService.linkedWorkerList$;

  @override
  Future<void> onInit() async {
    await super.onInit();

    _workerService.fetchAllLinkedWorkers();
  }

  @override
  void onClose() {
    _workerService.cleanLinkedWorkerList();

    super.onClose();
  }
}

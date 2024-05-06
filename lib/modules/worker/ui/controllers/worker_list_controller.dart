import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerListController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerListController';

  late final IWorkerService _workerService = Get.find();

  WorkerModel? get currentWorker => _workerService.loggedWorker$;
  List<WorkerModel> get linkedWorkerList$ => _workerService.linkedWorkerList$;

  @override
  void onInit() {
    super.onInit();
    _workerService.initializeLinkedWorkerStream();
  }

  @override
  void onClose() {
    _workerService.cancelLinkedWorkerStream();
    super.onClose();
  }
}

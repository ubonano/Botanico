import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerListController extends GetxController with ContextController {
  @override
  String get logTag => 'WorkerListController';

  late final WorkerService _workerService = Get.find();
  final linkedWorkerList$ = RxList<LinkedWorkerModel>();

  @override
  void onInit() {
    super.onInit();

    fetchAllLinkedWorkers();
  }

  Future<void> fetchAllLinkedWorkers() async => linkedWorkerList$.value = await _workerService.getAllLinkedWorkers();

  void removeLinkedWorker(LinkedWorkerModel linkedWorker) =>
      linkedWorkerList$.removeWhere((lw) => lw.uid == linkedWorker.uid);

  @override
  void onClose() {
    linkedWorkerList$.clear();

    super.onClose();
  }
}

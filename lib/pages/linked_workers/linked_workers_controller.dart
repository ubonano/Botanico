import 'package:botanico/models/linked_worker.dart';
import 'package:get/get.dart';
import '../../services/custom_controller.dart';
import '../../services/linked_worker_service.dart';

class LinkedWorkersController extends GetxController with CustomController {
  @override
  String get logTag => 'LinkedWorkersController';

  late final linkedWorkerService = Get.find<LinkedWorkerService>();

  RxList<LinkedWorkerModel> get linkedWorkers$ => linkedWorkerService.linkedWorkers$;

  void navigateToLinkWorker() => navigate.toLinkWorker(canPop: true);

  @override
  Future<void> onInit() async {
    await super.onInit();

    await fetchLinkedWorkers();
  }

  Future<void> fetchLinkedWorkers() async => await linkedWorkerService.fetchAll(companyId);
  void cleanLinkedWorkers() => linkedWorkerService.clean();

  @override
  void onClose() {
    cleanLinkedWorkers();

    super.onClose();
  }
}

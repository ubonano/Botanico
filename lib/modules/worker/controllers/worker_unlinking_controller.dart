import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerUnlinkingController extends GetxController with ContextController {
  @override
  String get logTag => 'WorkerUnlinkingController';

  late final WorkerService _workerService = Get.find();
  late final WorkerListController _workerListController = Get.find();

  Future<void> unlinkWorker(LinkedWorkerModel linkedWorker) async {
    await operationManager.perform(
      operationName: 'Unlink worker',
      permissionKey: WorkerPermissions.unlinkKey,
      successMessage: 'Trabajador desvinculado',
      inTransaction: true,
      operation: (txn) async => await _workerService.unlinkWorker(linkedWorker.uid, txn: txn),
      onSuccess: () => _workerListController.removeLinkedWorker(linkedWorker),
    );
  }
}

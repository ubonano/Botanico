import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerUnlinkingController extends GetxController with ContextController {
  @override
  String get logTag => 'WorkerUnlinkingController';

  late final WorkerService _workerService = Get.find();
  late final WorkerListController _workerListController = Get.find();

  Future<void> unlinkWorker(WorkerModel worker) async {
    await operationManager.perform(
      operationName: 'Unlink worker',
      permissionKey: WorkerPermissions.unlinkKey,
      successMessage: 'Trabajador desvinculado',
      inTransaction: true,
      operation: (txn) async => await _workerService.unlinkWorker(worker.uid, txn: txn),
      onSuccess: () => _workerListController.removeWorker(worker),
    );
  }
}

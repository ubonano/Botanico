import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class WorkerUnlinkingController extends GetxController with ContextController {
  @override
  String get logTag => 'WorkerUnlinkingController';

  late final WorkerRepository _workerRepo = Get.find();

  WorkerModel? get currentWorker => _workerRepo.currentWorker$;

  Future<void> submit(WorkerModel worker) async => await unlinkWorker(worker.uid);

  Future<void> unlinkWorker(String workerId) async {
    await oprManager.perform(
      operationName: 'Unlink worker',
      permissionKey: WorkerModulePermissions.unlinkKey,
      successMessage: 'Trabajador desvinculado',
      inTransaction: true,
      operation: (txn) async {
        final WorkerModel? currentWorker = await _workerRepo.get(authRepo.user!.uid);

        await _workerRepo.deleteLinkedWorker(currentWorker!.companyId, workerId, txn: txn);

        final changes = {'companyId': '', 'role': workerRoleToString(WorkerRole.undefined), 'permissions': {}};

        await _workerRepo.updatePartialWorker(workerId, changes, txn: txn);
      },
    );
  }
}

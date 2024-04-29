import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerUnlinkingController extends GetxController
    with LifeCycleLogging, GlobalServices, AuthenticationContext, WorkerContext {
  @override
  String get logTag => 'WorkerUnlinkingController';

  WorkerModel? get currentWorker => workerRepo.currentWorker$;

  Future<void> submit(WorkerModel worker) async => await _unlinkWorker(worker.uid);

  Future<void> _unlinkWorker(String workerId) async {
    await oprManager.perform(
      operationName: 'Unlink worker',
      permissionKey: WorkerModulePermissions.unlinkKey,
      successMessage: 'Trabajador desvinculado',
      inTransaction: true,
      operation: (txn) async {
        final WorkerModel? currentWorker = await workerRepo.get(currentUser!.uid);

        await workerRepo.deleteLinkedWorker(currentWorker!.companyId, workerId, txn: txn);

        final changes = {'companyId': '', 'role': workerRoleToString(WorkerRole.undefined), 'permissions': {}};

        await workerRepo.updatePartialWorker(workerId, changes, txn: txn);
      },
    );
  }
}

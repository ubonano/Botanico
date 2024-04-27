import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerUnlinkingController extends GetxController with LifeCycleLogging {
  @override
  String get logTag => 'WorkerUnlinkingController';

  late final OperationManagerService _oprManager = Get.find();
  late final AuthRepository _authRepo = Get.find();
  late final WorkerRepository _workerRepo = Get.find();

  WorkerModel? get currentWorker => _workerRepo.currentWorker$;

  Future<void> submit(WorkerModel worker) async => await _unlinkWorker(worker.uid);

  Future<void> _unlinkWorker(String workerId) async {
    await _oprManager.perform(
      operationName: 'Unlink worker',
      permissionKey: WorkerModulePermissions.unlinkKey,
      successMessage: 'Trabajador desvinculado',
      inTransaction: true,
      operation: (txn) async {
        final WorkerModel? currentWorker = await _workerRepo.get(_authRepo.user!.uid);

        await _workerRepo.deleteLinkedWorker(currentWorker!.companyId, workerId, txn: txn);

        final changes = {'companyId': '', 'role': workerRoleToString(WorkerRole.undefined), 'permissions': {}};

        await _workerRepo.updatePartialWorker(workerId, changes, txn: txn);
      },
    );
  }
}

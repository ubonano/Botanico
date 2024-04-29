import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/core/mixins/global_services.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerHandler with GlobalServices, AuthenticationContext, WorkerContext {
  Future<void> updateWorkerAsOwner(String companyId, Transaction? txn) async {
    final userId = authRepo.user!.uid;

    await workerRepo.updatePartialWorker(
      userId,
      {'companyId': companyId, 'role': workerRoleToString(WorkerRole.owner)},
      txn: txn,
    );

    await workerRepo.fetch(userId);
  }

  Future<void> createWorker(WorkerModel worker) async =>
      await workerRepo.createWorker(worker.copyWith(uid: currentUser!.uid, email: currentUser!.email));

  Future<void> postCreateWorker() async {
    await workerRepo.fetch(authRepo.user!.uid);
    navigate.toLobby();
  }
}

import 'dart:async';

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerListController extends GetxController with LifeCycleLogging, GlobalServices, AuthContext, WorkerContext {
  @override
  String get logTag => 'WorkerListController';

  StreamSubscription<List<WorkerModel>>? _workerListSubscription;

  final workerList$ = RxList<WorkerModel>();

  @override
  void onInit() {
    super.onInit();

    _fetchWorkers();
  }

  Future<void> _fetchWorkers() async {
    await oprManager.perform(
      operationName: 'Fetch workers',
      permissionKey: WorkerModulePermissions.viewKey,
      operation: (_) async {
        final WorkerModel? worker = await workerRepo.fetch(authRepo.user!.uid);

        _workerListSubscription =
            workerRepo.linkedWorkersStream(worker!.companyId).listen((workerList) => workerList$.value = workerList);
      },
    );
  }

  @override
  void onClose() {
    _workerListSubscription?.cancel();
    workerList$.clear();

    super.onClose();
  }
}

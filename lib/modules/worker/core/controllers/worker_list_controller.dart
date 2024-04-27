import 'dart:async';

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerListController extends GetxController with LifeCycleLogging {
  @override
  String get logTag => 'WorkerListController';

  late final OperationManagerService _oprManager = Get.find();
  late final AuthRepository _authRepo = Get.find();
  late final WorkerRepository _workerRepository = Get.find();
  StreamSubscription<List<WorkerModel>>? _workerListSubscription;

  final workerList$ = RxList<WorkerModel>();

  @override
  void onInit() {
    super.onInit();

    _fetchWorkers();
  }

  Future<void> _fetchWorkers() async {
    await _oprManager.perform(
      operationName: 'Fetch workers',
      permissionKey: WorkerModulePermissions.viewKey,
      operation: (_) async {
        final WorkerModel? worker = await _workerRepository.fetch(_authRepo.user!.uid);

        _workerListSubscription = _workerRepository
            .linkedWorkersStream(worker!.companyId)
            .listen((workerList) => workerList$.value = workerList);
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

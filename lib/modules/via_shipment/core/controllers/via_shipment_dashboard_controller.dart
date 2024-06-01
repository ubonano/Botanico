import 'dart:async';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../module.dart';

class ViaShipmentDashboardController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentDashboardController';

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();
  late final IViaShipmentService _viaShipmentService = Get.find();

  final list$ = RxList<ViaShipmentModel>();
  StreamSubscription<List<ViaShipmentModel>>? _subscription;

  @override
  Future<void> onInit() async {
    super.onInit();

    await _workerService.fetchLoggedWorker();
    await _companyService.fetchLoggedCompany();

    _subscription = _viaShipmentService.initializeStream(
      list$: list$,
      limit: 100,
      states: [
        ViaShipmentState.pending,
        ViaShipmentState.inProcess,
        ViaShipmentState.ready,
        ViaShipmentState.delivered
      ],
    );
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}

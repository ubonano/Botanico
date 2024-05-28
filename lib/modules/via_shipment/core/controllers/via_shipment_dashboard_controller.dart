import 'dart:async';

import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';
import '../../module.dart';

class ViaShipmentDashboardController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentDashboardController';

  late final IViaShipmentService _viaShipmentService = Get.find();

  final list$ = RxList<ViaShipmentModel>();
  StreamSubscription<List<ViaShipmentModel>>? _subscription;

  @override
  void onInit() {
    super.onInit();
    _viaShipmentService.initializePaginatedViaShipmentStream_V2(
      list$: list$,
      subscription: _subscription,
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

import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';
import '../../module.dart';

class ViaShipmentDashboardController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentDashboardController';

  late final IViaShipmentBusinessLogic _viaShipmentBusinessLogic = Get.find();

  RxList<ViaShipmentModel> get viaShipmentList$ => _viaShipmentBusinessLogic.viaShipmentList$;

  @override
  void onInit() {
    super.onInit();
    _viaShipmentBusinessLogic.initializePaginatedViaShipmentStream(
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
    _viaShipmentBusinessLogic.cancelViaShipmentStream();
    super.onClose();
  }
}

import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class ViaShipmentListController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentListController';

  late final IViaShipmentBusinessLogic _viaShipmentBusinessLogic = Get.find();

  RxList<ViaShipmentModel> get viaShipmentList$ => _viaShipmentBusinessLogic.viaShipmentList$;

  @override
  void onInit() {
    super.onInit();
    _viaShipmentBusinessLogic.initializeViaShipmentStream();
  }

  @override
  void onClose() {
    _viaShipmentBusinessLogic.cancelViaShipmentStream();
    super.onClose();
  }
}


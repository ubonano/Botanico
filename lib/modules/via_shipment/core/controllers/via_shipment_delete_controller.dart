import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class ViaShipmentDeleteController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentDeleteController';

  late final IViaShipmentService _viaShipmentService = Get.find();

  Future<void> submit(ViaShipmentModel viaShipment) async => await _viaShipmentService.delete(viaShipment.id);
}


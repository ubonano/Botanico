import 'package:get/get.dart';
import '../../module.dart';

class ViaShipmentArchiveController extends GetxController {
  final IViaShipmentService _viaShipmentService = Get.find();

  Future<void> archiveShipment(ViaShipmentModel viaShipment) async =>
      await _viaShipmentService.archiveShipment(viaShipment);
}


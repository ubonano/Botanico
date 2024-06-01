import 'package:get/get.dart';

import '../../module.dart';

class ViaShipmentInvoiceController extends GetxController {
  final IViaShipmentService _viaShipmentService = Get.find();

  Future<void> submit(ViaShipmentModel viaShipment) async => await _viaShipmentService.invoice(viaShipment);
}

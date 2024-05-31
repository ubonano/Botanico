import 'package:get/get.dart';

import '../../module.dart';

class ViaShipmentToggleInvoicedController extends GetxController {
  final IViaShipmentService _viaShipmentService = Get.find();

  Future<void> invoiceShipment(ViaShipmentModel viaShipment) async =>
      await _viaShipmentService.invoiceShipment(viaShipment);

  Future<void> cancelInvoiceShipment(ViaShipmentModel viaShipment) async =>
      await _viaShipmentService.cancelInvoiceShipment(viaShipment);
}

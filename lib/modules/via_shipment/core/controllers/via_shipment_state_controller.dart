import 'package:get/get.dart';

import '../../module.dart';

class ViaShipmentStateController extends GetxController {
  final IViaShipmentService _viaShipmentService = Get.find();

  Future<void> process(ViaShipmentModel shipment) async => await _viaShipmentService.process(shipment);
  Future<void> prepare(ViaShipmentModel shipment) async => await _viaShipmentService.prepare(shipment);
  Future<void> deliver(ViaShipmentModel shipment) async => await _viaShipmentService.deliver(shipment);
  Future<void> archive(ViaShipmentModel shipment) async => await _viaShipmentService.archive(shipment);
}

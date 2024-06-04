import 'package:get/get.dart';
import '../../module.dart';

class ViaShipmentChangeDeliveryPlaceController extends GetxController {
  final IViaShipmentService _viaShipmentService = Get.find();

  Future<void> changeDeliveryPlace(ViaShipmentModel viaShipment, String newPlace) async {
    final updatedShipment = viaShipment.copyWith(deliveryPlace: newPlace);
    await _viaShipmentService.update(updatedShipment);
  }
}

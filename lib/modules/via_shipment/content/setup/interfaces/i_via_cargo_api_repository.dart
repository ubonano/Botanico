import '../../model/via_shipment_model.dart';
export '../../model/via_shipment_model.dart';

abstract class IViaCargoApiRepository {
  Future<String?> fetchToken();
  Future<ViaShipmentModel?> getTrackingData({
    String? idEnvio,
    String? numeroEnvio,
    int? interfaz,
    String? tokenRecaptcha,
  });
}

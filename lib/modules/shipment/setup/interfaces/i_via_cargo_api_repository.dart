import '../model/shipment_model.dart';
export '../model/shipment_model.dart';

abstract class IViaCargoApiRepository {
  Future<void> initializeConfig(String environment);
  Future<String?> fetchToken();
  Future<ShipmentModel?> getTrackingData({
    String? idEnvio,
    String? numeroEnvio,
    int? interfaz,
    String? tokenRecaptcha,
  });
}

import '../../module.dart';

abstract class IViaCargoApiRepository {
  Future<String?> fetchToken();
  Future<ViaShipmentModel?> getTrackingData({
    String? idEnvio,
    String? numeroEnvio,
    int? interfaz,
    String? tokenRecaptcha,
  });
}

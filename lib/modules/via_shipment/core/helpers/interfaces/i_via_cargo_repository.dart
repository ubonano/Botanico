import '../../../module.dart';

abstract class IViaCargoRepository {
  Future<String?> getToken();
  Future<ViaShipmentModel?> getTrackingData({
    String? idEnvio,
    String? numeroEnvio,
    int? interfaz,
    String? tokenRecaptcha,
  });
}

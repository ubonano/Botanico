import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class IViaShipmentService {
  List<ViaShipmentModel> get viaShipmentList$;

  Future<ViaShipmentModel?> get(String id);
  Future<void> createViaShipment(ViaShipmentModel viaShipment);
  Future<void> updateViaShipment(ViaShipmentModel viaShipment);
  Future<void> deleteViaShipment(String id);
  Future<void> initializeViaShipmentStream();
  Future<void> initializePaginatedViaShipmentStream({DocumentSnapshot? startAfter, int limit = 20});
  void cancelViaShipmentStream();
}

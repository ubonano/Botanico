import 'package:get/get.dart';

import '../../via_shipment_business_logic.dart';
import '../../via_shipment_service.dart';
import '../model/via_cargo_api_repository.dart';
import '../../via_shipment_repository.dart';
import '../../ui/ui.dart';
import 'interfaces/i_via_cargo_api_repository.dart';
import 'interfaces/i_via_shipment_business_logic.dart';
import 'interfaces/i_via_shipment_repository.dart';
import 'interfaces/i_via_shipment_service.dart';
import 'permissions.dart';

void setupDependencies() {
  Get.lazyPut<ViaShipmentPermissions>(() => ViaShipmentPermissions(), fenix: true);

  Get.lazyPut<IViaShipmentBusinessLogic>(() => ViaShipmentBusinessLogic(), fenix: true);
  Get.lazyPut<IViaCargoApiRepository>(() => ViaCargoApiRepository('prod'));
  Get.lazyPut<IViaShipmentRepository>(() => ViaShipmentRepository(), fenix: true);
  Get.lazyPut<IViaShipmentService>(() => ViaShipmentService(), fenix: true);

  Get.lazyPut<ViaShipmentFormController>(() => ViaShipmentFormController(), fenix: true);
  Get.lazyPut<ViaShipmentListController>(() => ViaShipmentListController(), fenix: true);
  Get.lazyPut<ViaShipmentDashboardController>(() => ViaShipmentDashboardController(), fenix: true);
}

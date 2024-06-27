import 'package:get/get.dart';

import '../../shipment_business_logic.dart';
import '../../shipment_service.dart';
import '../model/via_cargo_api_repository.dart';
import '../../shipment_repository.dart';
import '../../ui/ui.dart';
import 'interfaces/i_via_cargo_api_repository.dart';
import 'interfaces/i_shipment_business_logic.dart';
import 'interfaces/i_shipment_repository.dart';
import 'interfaces/i_shipment_service.dart';
import 'permissions.dart';

void setupDependencies() {
  Get.lazyPut<ShipmentPermissions>(() => ShipmentPermissions(), fenix: true);

  Get.lazyPut<IShipmentBusinessLogic>(() => ShipmentBusinessLogic(), fenix: true);
  Get.lazyPut<IViaCargoApiRepository>(() => ViaCargoApiRepository('prod'));
  Get.lazyPut<IShipmentRepository>(() => ShipmentRepository(), fenix: true);
  Get.lazyPut<IShipmentService>(() => ShipmentService(), fenix: true);

  Get.lazyPut<ShipmentFormController>(() => ShipmentFormController(), fenix: true);
  Get.lazyPut<ShipmentListController>(() => ShipmentListController(), fenix: true);
  Get.lazyPut<ShipmentDashboardController>(() => ShipmentDashboardController(), fenix: true);
}

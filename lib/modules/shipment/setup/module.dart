import 'package:get/get.dart';

import '../../app/content/setup/interfaces/i_module_structure.dart';
import '../shipment_business_logic.dart';
import '../shipment_repository.dart';
import '../shipment_service.dart';
import '../ui/ui.dart';
import 'interfaces/i_shipment_business_logic.dart';
import 'interfaces/i_shipment_repository.dart';
import 'interfaces/i_shipment_service.dart';
import 'interfaces/i_via_cargo_api_repository.dart';
import 'model/via_cargo_api_repository.dart';
export '../../app/content/setup/interfaces/i_module_structure.dart';

class ShipmentModule implements IModuleStructure {
  @override
  String get id => moduleId;
  static const String moduleId = 'shipment';

  @override
  String get label => moduleLabel;
  static const String moduleLabel = 'Envíos';

  @override
  List<KeyModel> get keys => ShipmentKeys.values.map((key) => KeyModel(id: key.id, label: key.label)).toList();

  static void dependencies() {
    Get.lazyPut<ShipmentModule>(() => ShipmentModule(), fenix: true);

    Get.lazyPut<IShipmentBusinessLogic>(() => ShipmentBusinessLogic(), fenix: true);
    Get.lazyPut<IViaCargoApiRepository>(() => ViaCargoApiRepository('prod'));
    Get.lazyPut<IShipmentRepository>(() => ShipmentRepository(), fenix: true);
    Get.lazyPut<IShipmentService>(() => ShipmentService(), fenix: true);

    Get.lazyPut<ShipmentFormController>(() => ShipmentFormController(), fenix: true);
    Get.lazyPut<ShipmentCabinetController>(() => ShipmentCabinetController(), fenix: true);
    Get.lazyPut<ShipmentDashboardController>(() => ShipmentDashboardController(), fenix: true);
  }

  static final List<GetPage> pages = [
    ShipmentFormPage.page,
    ShipmentCabinetPage.page,
    ShipmentDashboardPage.page,
  ];
}

enum ShipmentKeys {
  cabinet('${ShipmentModule.moduleId}.cabinet', 'Ver archivo'),
  dashboard('${ShipmentModule.moduleId}.dashboard', 'Dashboard'),
  create('${ShipmentModule.moduleId}.create', 'Crear'),
  update('${ShipmentModule.moduleId}.update', 'Actualizar'),
  delete('${ShipmentModule.moduleId}.delete', 'Eliminar'),
  invoice('${ShipmentModule.moduleId}.invoice', 'Facturar'),
  cancelInvoice('${ShipmentModule.moduleId}.cancel_invoice', 'Anular Factura'),
  process('${ShipmentModule.moduleId}.process', 'Procesar envío'),
  prepare('${ShipmentModule.moduleId}.prepare', 'Alistar envío'),
  deliver('${ShipmentModule.moduleId}.deliver', 'Entregar envío'),
  archive('${ShipmentModule.moduleId}.archive', 'Archivar envío'),
  cancel('${ShipmentModule.moduleId}.cancel', 'Cancelar envío'),
  changeDeliveryPlace('${ShipmentModule.moduleId}.change_delivery_place', 'Cambiar lugar de entrega'),
  changeState('${ShipmentModule.moduleId}.change_state', 'Cambiar estado');

  final String id;
  final String label;

  const ShipmentKeys(this.id, this.label);
}

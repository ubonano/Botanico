import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import 'ui/via_shipment_form_page/via_shipment_form_controller.dart';
import 'ui/via_shipment_list_page/via_shipment_list_controller.dart';
import 'ui/via_shipment_dashboard_page/via_shipment_dashboard_controller.dart';

import 'core/via_shipment_business_logic.dart';
import 'core/model/via_cargo_api_repository.dart';
import 'core/model/via_shipment_repository.dart';
import 'core/via_shipment_service.dart';
import 'core/interfaces/i_via_shipment_business_logic.dart';
import 'core/interfaces/i_via_cargo_api_repository.dart';
import 'core/interfaces/i_via_shipment_repository.dart';
import 'core/interfaces/i_via_shipment_service.dart';

export 'ui/via_shipment_form_page/via_shipment_form_controller.dart';
export 'ui/via_shipment_list_page/via_shipment_list_controller.dart';
export 'ui/via_shipment_dashboard_page/via_shipment_dashboard_controller.dart';

export 'core/via_shipment_business_logic.dart';

export 'core/interfaces/i_via_shipment_business_logic.dart';
export 'core/interfaces/i_via_cargo_api_repository.dart';
export 'core/interfaces/i_via_shipment_repository.dart';
export 'core/interfaces/i_via_shipment_service.dart';

export 'navigation_helper.dart';

export 'core/model/via_shipment_model.dart';
export 'core/model/via_shipment_action_log_model.dart';

export 'core/model/via_cargo_api_repository.dart';
export 'core/model/via_shipment_repository.dart';
export 'core/via_shipment_service.dart';

export 'tests/flows/via_shipment_list_navigate_flow.dart';
export 'tests/flows/via_shipment_create_navigate_flow.dart';
export 'tests/flows/via_shipment_save_flow.dart';
export 'tests/flows/via_shipment_fill_data_flow.dart';

export 'tests/via_shipment_create/via_shipment_empty_fields_test.dart';
export 'tests/via_shipment_create/via_shipment_create_success_test.dart';
export 'tests/via_shipment_list/via_shipment_list_find_by_name_test.dart';
export 'tests/via_shipment_list/via_shipment_list_find_enter_validate_all_fields_test.dart';
export 'tests/via_shipment_update/via_shipment_update_success_test.dart';
export 'tests/via_shipment_delete/via_shipment_delete_test.dart';

export 'ui/via_shipment_list_page/widgets/via_shipment_create_fab.dart';
export 'ui/via_shipment_list_page/widgets/via_shipment_list_page_tile_button.dart';
export 'ui/via_shipment_list_page/widgets/via_shipment_delete_icon_button.dart';
export 'ui/via_shipment_list_page/widgets/via_shipment_list_tile_trailing_icon_buttons.dart';
export 'ui/via_shipment_form_page/widgets/via_shipment_enabled_form_fields.dart';
export 'ui/via_shipment_form_page/widgets/shipment_id_search_button.dart';
export 'ui/via_shipment_form_page/widgets/via_shipment_save_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/archive_slidable_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/deliver_slidable_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/prepare_slidable_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/process_slidable_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/delete_slidable_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/edit_slidable_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/invoice_slidable_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/cancel_invoice_slidable_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/change_delivery_place_slidable_button.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/build_slidable_buttons_action_pane.dart';
export 'ui/via_shipment_dashboard_page/widgets/slidable_buttons/change_state_slidable_button.dart';

export 'ui/via_shipment_form_page/widgets/fields/state_input_field.dart';
export 'ui/via_shipment_form_page/widgets/fields/is_invoiced_input_field.dart';
export 'ui/via_shipment_form_page/widgets/fields/created_date_time_input_field.dart';
export 'ui/via_shipment_form_page/widgets/fields/delivery_place_input_field.dart';
export 'ui/via_shipment_form_page/widgets/fields/shipment_id_input_field.dart';
export 'ui/via_shipment_form_page/widgets/fields/type_input_field.dart';
export 'ui/via_shipment_form_page/widgets/fields/client_input_field.dart';
export 'ui/via_shipment_form_page/widgets/fields/package_input_field.dart';
export 'ui/via_shipment_form_page/widgets/fields/weight_input_field.dart';
export 'ui/via_shipment_form_page/widgets/fields/description_input_field.dart';

export 'ui/via_shipment_dashboard_page/widgets/layuots/via_shipment_dashboard_layout_large_tile.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/via_shipment_dashboard_layout_small_tile.dart';

export 'ui/via_shipment_list_page/widgets/via_shipment_list_tile_trailing.dart';
export 'ui/via_shipment_list_page/widgets/via_shipment_list_tile_title.dart';
export 'ui/via_shipment_dashboard_page/widgets/via_shipment_dashboard_tile.dart';
export 'ui/via_shipment_list_page/widgets/via_shipment_list.dart';
export 'ui/via_shipment_dashboard_page/widgets/via_shipment_dashboard_list.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/icon_with_text.dart';
export 'ui/via_shipment_dashboard_page/widgets/state_tag.dart';
export 'ui/via_shipment_form_page/widgets/action_logs_list.dart';
export 'ui/via_shipment_list_page/widgets/via_shipment_filters.dart';

export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/description_widget.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/state_widget.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/invoiced_widget.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/delivery_place_widget.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/client_widget.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/package_widget.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/weight_widget.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/shipment_id_widget.dart';
export 'ui/via_shipment_dashboard_page/widgets/layuots/data_widgets/shipment_type_widget.dart';
export 'ui/via_shipment_list_page/widgets/via_shipment_list_tile.dart';

export 'ui/via_shipment_form_page/via_shipment_form_page.dart';
export 'ui/via_shipment_list_page/via_shipment_list_page.dart';
export 'ui/via_shipment_dashboard_page/via_shipment_dashboard_page.dart';

export 'core/model/enums/via_shipment_type.dart';
export 'core/model/enums/via_shipment_state.dart';
export 'core/model/enums/via_shipment_delivery_place.dart';

void dependencies() {
  Get.lazyPut<IViaShipmentBusinessLogic>(() => ViaShipmentBusinessLogic(), fenix: true);

  Get.lazyPut<IViaCargoApiRepository>(() => ViaCargoApiRepository(), fenix: true);
  Get.lazyPut<IViaShipmentRepository>(() => ViaShipmentRepository(), fenix: true);
  Get.lazyPut<IViaShipmentService>(() => ViaShipmentService(), fenix: true);

  Get.lazyPut<ViaShipmentFormController>(() => ViaShipmentFormController(), fenix: true);
  Get.lazyPut<ViaShipmentListController>(() => ViaShipmentListController(), fenix: true);
  Get.lazyPut<ViaShipmentDashboardController>(() => ViaShipmentDashboardController(), fenix: true);
}

class ViaShipmentModulePermissions implements ModuleStructure {
  @override
  String get moduleId => 'via_shipment';

  @override
  String get moduleName => 'Envíos Via';

  static const viewKey = 'via_shipment.view';
  static const createKey = 'via_shipment.create';
  static const updateKey = 'via_shipment.update';
  static const deleteKey = 'via_shipment.delete';
  static const dashboardKey = 'via_shipment.dashboard';
  static const invoiceKey = 'via_shipment.invoice';
  static const cancelInvoiceKey = 'via_shipment.cancel_invoice';

  static const processKey = 'via_shipment.process';
  static const prepareKey = 'via_shipment.preper';
  static const deliverKey = 'via_shipment.deliver';
  static const archiveKey = 'via_shipment.archive';

  static const changeDeliveryPlaceKey = 'via_shipment.change_delivery_place';
  static const changeStateKey = 'via_shipment.change_state';

  @override
  List<WorkerPermissionModel> get permissions => [
        WorkerPermissionModel(id: viewKey, name: 'Ver'),
        WorkerPermissionModel(id: createKey, name: 'Crear'),
        WorkerPermissionModel(id: updateKey, name: 'Actualizar'),
        WorkerPermissionModel(id: deleteKey, name: 'Eliminar'),
        WorkerPermissionModel(id: dashboardKey, name: 'Dashboard'),
        WorkerPermissionModel(id: invoiceKey, name: 'Facturar'),
        WorkerPermissionModel(id: cancelInvoiceKey, name: 'Anular Factura'),
        WorkerPermissionModel(id: processKey, name: 'Processar envío'),
        WorkerPermissionModel(id: prepareKey, name: 'Alistar envío'),
        WorkerPermissionModel(id: deliverKey, name: 'Entregar envío'),
        WorkerPermissionModel(id: archiveKey, name: 'Archivar envío'),
        WorkerPermissionModel(id: changeStateKey, name: 'Cambiar estado'),
        WorkerPermissionModel(id: changeDeliveryPlaceKey, name: 'Cambiar lugar de entrega'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(id: moduleId, name: moduleName, permissions: permissions);
}

import 'package:botanico/modules/shipment/ui/shipment_cabinet_page/shipment_cabinet_page.dart';
import 'package:botanico/modules/shipment/ui/shipment_dashboard_page/shipment_dashboard_page.dart';
import 'package:get/get.dart';

import 'shipment_form_page/shipment_form_page.dart';

export 'shipment_dashboard_page/shipment_dashboard_page.dart';
export 'shipment_dashboard_page/shipment_dashboard_controller.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/description_widget.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/delivery_place_widget.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/icon_with_text.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/invoiced_widget.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/package_widget.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/shipment_id_widget.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/shipment_type_widget.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/state_widget/state_widget.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/weight_widget.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/client_widget.dart';
export 'shipment_dashboard_page/widgets/layuots/shipment_dashboard_layout_large_tile.dart';
export 'shipment_dashboard_page/widgets/layuots/shipment_dashboard_layout_small_tile.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/archive_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/cancel_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/build_slidable_buttons_action_pane.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/cancel_invoice_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/change_delivery_place_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/change_state_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/delete_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/deliver_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/edit_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/invoice_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/prepare_slidable_button.dart';
export 'shipment_dashboard_page/widgets/slidable_buttons/slidable_buttons_action_pane/widgets/process_slidable_button.dart';
export 'shipment_dashboard_page/widgets/layuots/data_widgets/state_widget/state_tag.dart';
export 'shipment_dashboard_page/widgets/shipment_dashboard_list.dart';
export 'shipment_dashboard_page/widgets/shipment_dashboard_tile.dart';
export 'shipment_form_page/shipment_form_page.dart';
export 'shipment_form_page/shipment_form_controller.dart';
export 'shipment_form_page/widgets/action_logs_list.dart';
export 'shipment_form_page/widgets/fields/client_input_field.dart';
export 'shipment_form_page/widgets/fields/created_date_time_input_field.dart';
export 'shipment_form_page/widgets/fields/delivery_place_input_field.dart';
export 'shipment_form_page/widgets/fields/description_input_field.dart';
export 'shipment_form_page/widgets/fields/is_invoiced_input_field.dart';
export 'shipment_form_page/widgets/fields/package_input_field.dart';
export 'shipment_form_page/widgets/fields/shipment_id_input_field.dart';
export 'shipment_form_page/widgets/fields/state_input_field.dart';
export 'shipment_form_page/widgets/fields/type_input_field.dart';
export 'shipment_form_page/widgets/fields/weight_input_field.dart';
export 'shipment_form_page/widgets/shipment_save_button.dart';
export 'shipment_form_page/widgets/shipment_enabled_form_fields.dart';
export 'shipment_form_page/widgets/shipment_id_search_button.dart';
export 'shipment_form_page/widgets/shipment_paste_id_button.dart';
export 'shipment_cabinet_page/shipment_cabinet_page.dart';
export 'shipment_cabinet_page/shipment_cabinet_controller.dart';
export 'shipment_cabinet_page/widgets/shipment_list/widgets/shipment_list_tile/widgets/shipment_list_tile_trailing/widgets/shipment_invoiced_tooltip.dart';
export 'shipment_cabinet_page/widgets/shipment_list/widgets/shipment_list_tile/widgets/shipment_list_tile_trailing/widgets/shipment_state_tooltip.dart';
export 'shipment_cabinet_page/widgets/shipment_list/widgets/shipment_list_tile/widgets/shipment_list_tile_trailing/widgets/shipment_type_tooltip.dart';
export 'widgets/shipment_create_fab.dart';
export 'shipment_cabinet_page/widgets/shipment_list/widgets/shipment_list_tile/widgets/shipment_list_tile_trailing/widgets/shipment_list_tile_trailing_icon_buttons/widgets/shipment_delete_icon_button.dart';
export 'shipment_cabinet_page/widgets/shipment_cabinet_filters.dart';
export 'shipment_cabinet_page/widgets/shipment_list/shipment_list.dart';
export 'widgets/shipment_module_tile_button.dart';
export 'shipment_cabinet_page/widgets/shipment_list/widgets/shipment_list_tile/shipment_list_tile.dart';
export 'shipment_cabinet_page/widgets/shipment_list/widgets/shipment_list_tile/widgets/shipment_list_tile_title.dart';
export 'shipment_cabinet_page/widgets/shipment_list/widgets/shipment_list_tile/widgets/shipment_list_tile_trailing/shipment_list_tile_trailing.dart';
export 'shipment_cabinet_page/widgets/shipment_list/widgets/shipment_list_tile/widgets/shipment_list_tile_trailing/widgets/shipment_list_tile_trailing_icon_buttons/shipment_list_tile_trailing_icon_buttons.dart';

final List<GetPage> pages = [
  ShipmentFormPage.page,
  ShipmentCabinetPage.page,
  ShipmentDashboardPage.page,
];

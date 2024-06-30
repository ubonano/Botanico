import 'package:get/get.dart';

import 'pages/worker_form_page/worker_form_page.dart';
import 'pages/worker_link_page/worker_link_page.dart';
import 'pages/worker_list_page/worker_list_page.dart';
import 'pages/worker_lobby_page/worker_lobby_page.dart';
import 'pages/worker_permission_management_page/worker_permission_management_page.dart';

export 'pages/worker_lobby_page/widgets/worker_copy_uid_button.dart';
export 'pages/worker_list_page/worker_list_page.dart';
export 'pages/worker_form_page/widgets/fields/worker_uid_input_field.dart';
export 'pages/worker_permission_management_page/widgets/module_expansion_tile.dart';
export 'pages/worker_permission_management_page/worker_permission_management_page.dart';
export 'pages/worker_form_page/widgets/worker_save_button.dart';
export 'pages/worker_lobby_page/widgets/worker_scan_qr_button.dart';
export 'pages/worker_form_page/worker_form_page.dart';
export 'pages/worker_list_page/widgets/worker_list_page_tile_button.dart';
export 'pages/worker_lobby_page/worker_lobby_page.dart';
export 'pages/worker_form_page/worker_form_controller.dart';
export 'pages/worker_form_page/widgets/fields/fullname_input_field.dart';
export 'pages/worker_link_page/worker_link_page.dart';
export 'pages/worker_list_page/widgets/worker_link_button.dart';
export 'pages/worker_form_page/widgets/fields/dni_input_field.dart';
export 'pages/worker_link_page/widgets/worker_paste_uid_button.dart';
export 'pages/worker_list_page/widgets/worker_unlink_icon_button.dart';
export 'pages/worker_permission_management_page/widgets/worker_permission_toggle/worker_permission_toggle_controller.dart';
export 'pages/worker_list_page/widgets/worker_link_fab.dart';
export 'pages/worker_list_page/widgets/worker_list.dart';
export 'pages/worker_lobby_page/widgets/worker_uid_qr_code.dart';
export 'pages/worker_list_page/widgets/worker_navigate_to_module_list_icon_button.dart';
export 'pages/worker_link_page/worker_link_controller.dart';
export 'pages/worker_list_page/worker_list_controller.dart';
export 'pages/worker_permission_management_page/widgets/worker_permission_toggle/worker_permission_toggle.dart';
export 'pages/worker_lobby_page/worker_lobby_controller.dart';
export 'pages/worker_list_page/widgets/worker_list_tile_trailing_icon_buttons.dart';
export 'pages/worker_permission_management_page/worker_permission_management_controller.dart';
export 'pages/worker_form_page/widgets/fields/birthdate_input_field.dart';

final List<GetPage> pages = [
  LobbyPage.page,
  WorkerFormPage.page,
  WorkerListPage.page,
  WorkerLinkPage.page,
  WorkerPermissionManagementPage.page,
];

import 'package:get/get.dart';

import 'pages/vendor_form_page/vendor_form_page.dart';
import 'pages/vendor_list_page/vendor_list_page.dart';

export 'pages/vendor_list_page/vendor_list_page.dart';
export 'pages/vendor_form_page/widgets/vendor_save_button.dart';
export 'pages/vendor_form_page/vendor_form_page.dart';
export 'pages/vendor_list_page/widgets/vendor_delete_icon_button.dart';
export 'pages/vendor_list_page/widgets/vendor_list_page_tile_button.dart';
export 'pages/vendor_form_page/widgets/fields/registration_type_input_field.dart';
export 'pages/vendor_form_page/widgets/fields/cuit_input_field.dart';
export 'pages/vendor_list_page/widgets/vendor_list.dart';
export 'pages/vendor_list_page/vendor_list_controller.dart';
export 'pages/vendor_form_page/widgets/fields/observations_input_field.dart';
export 'pages/vendor_form_page/vendor_form_controller.dart';
export 'pages/vendor_list_page/widgets/vendor_list_tile_trailing_icon_buttons.dart';
export 'pages/vendor_list_page/widgets/vendor_create_fab.dart';
export 'pages/vendor_list_page/widgets/vendor_update_icon_button.dart';
export 'pages/vendor_form_page/widgets/vendor_enabled_form_fields.dart';

final List<GetPage> pages = [
  VendorFormPage.page,
  VendorListPage.page,
];

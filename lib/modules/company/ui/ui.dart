import 'package:get/get.dart';

import 'company_form_page/company_form_page.dart';

export 'company_form_page/company_form_page.dart';
export 'company_form_page/company_form_controller.dart';
export 'company_form_page/widgets/buttons/company_create_navigate_button.dart';
export 'company_form_page/widgets/buttons/company_enabled_form_fields.dart';
export 'company_form_page/widgets/buttons/company_form_page_tile_button.dart';
export 'company_form_page/widgets/buttons/company_save_button.dart';
export 'company_form_page/widgets/fields/address_input_field.dart';
export 'company_form_page/widgets/fields/city_input_field.dart';
export 'company_form_page/widgets/fields/country_input_field.dart';
export 'company_form_page/widgets/fields/name_input_field.dart';
export 'company_form_page/widgets/fields/phone_input_field.dart';
export 'company_form_page/widgets/fields/province_input_field.dart';
export 'company_form_page/widgets/module_active_toggle.dart';

final List<GetPage> pages = [
  CompanyFormPage.page,
];

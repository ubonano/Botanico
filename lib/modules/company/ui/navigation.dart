// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../authentication/content/setup/middlewares.dart';
import '../../worker/ui/middlewares.dart';
import 'ui.dart';

mixin CompanyNavigation {
  static const COMPANY_FORM = '/company-form';

  void toCompanyForm({String id = '', bool canPop = false}) => to(COMPANY_FORM, arguments: id, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

final pages = [
  GetPage(
    name: CompanyNavigation.COMPANY_FORM,
    page: () => const CompanyFormPage(),
    middlewares: [
      AuthMiddleware(),
      HasWorkerMiddleware(),
    ],
  ),
];

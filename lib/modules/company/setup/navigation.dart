// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../app/ui/ui.dart';
import '../ui/ui.dart';

mixin CompanyNavigation {
  static const EMPTY = '/';
  static const HOME = '/home';
  static const COMPANY_FORM = '/company-form';

  void toHome({bool canPop = false}) => to(HOME, canPop: canPop);
  void toCompanyForm({String id = '', bool canPop = false}) => to(COMPANY_FORM, arguments: id, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

final pages = [
  GetPage(
    name: CompanyNavigation.EMPTY,
    page: () => const HomePage(),
  ),
  GetPage(
    name: CompanyNavigation.COMPANY_FORM,
    page: () => const CompanyFormPage(),
  ),
  GetPage(
    name: CompanyNavigation.HOME,
    page: () => const HomePage(),
  ),
];

// ignore_for_file: constant_identifier_names

mixin CompanyNavigationHelper {
  static const EMPTY = '/';
  static const HOME = '/home';
  static const COMPANY_FORM = '/company-form';

  void toHome({bool canPop = false}) => to(HOME, canPop: canPop);
  void toCompanyForm({String id = '', bool canPop = false}) => to(COMPANY_FORM, arguments: id, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

// ignore_for_file: constant_identifier_names

mixin CompanyNavigationHelper {
  static const COMPANY_CREATE = '/company-create';

  void toCompany({bool canPop = false}) => to(COMPANY_CREATE, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

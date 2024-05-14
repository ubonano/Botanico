// ignore_for_file: constant_identifier_names

mixin VendorNavigationHelper {
  static const VENDOR_FORM = '/vendor-form';
  static const VENDOR_LIST = '/vendor-list';

  void toVendorList({bool canPop = false}) => to(VENDOR_LIST, canPop: canPop);
  void toVendorForm({String id = '', bool canPop = false}) => to(VENDOR_FORM, arguments: id, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

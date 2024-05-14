// ignore_for_file: constant_identifier_names

mixin VendorNavigationHelper {
  static const VENDOR_CREATE = '/vendor-create';
  static const VENDOR_LIST = '/vendor-list';
  static const VENDOR_UPDATE = '/vendor-update';

  void toVendorCreate({bool canPop = false}) => to(VENDOR_CREATE, canPop: canPop);
  void toVendorList({bool canPop = false}) => to(VENDOR_LIST, canPop: canPop);
  void toVendorUpdate(String id, {bool canPop = false}) => to(VENDOR_UPDATE, arguments: id, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

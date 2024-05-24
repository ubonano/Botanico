// ignore_for_file: constant_identifier_names

mixin ViaShipmentNavigationHelper {
  static const VIA_SHIPMENT_FORM = '/via-shipment-form';
  static const VIA_SHIPMENT_LIST = '/via-shipment-list';

  void toViaShipmentList({bool canPop = false}) => to(VIA_SHIPMENT_LIST, canPop: canPop);
  void toViaShipmentForm({String id = '', bool canPop = false}) => to(VIA_SHIPMENT_FORM, arguments: id, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

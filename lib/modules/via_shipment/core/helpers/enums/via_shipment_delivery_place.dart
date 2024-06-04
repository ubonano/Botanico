enum ViaShipmentDeliveryPlace {
  toDefine,
  counter,
  gate,
  warehouse2,
}

String deliveryPlaceToString(ViaShipmentDeliveryPlace place) => place.toString().split('.').last;

ViaShipmentDeliveryPlace deliveryPlaceFromString(String placeString) =>
    ViaShipmentDeliveryPlace.values.firstWhere((place) => deliveryPlaceToString(place) == placeString);

final Map<ViaShipmentDeliveryPlace, String> deliveryPlaceLabels = {
  ViaShipmentDeliveryPlace.toDefine: 'A definir',
  ViaShipmentDeliveryPlace.counter: 'Mostrador',
  ViaShipmentDeliveryPlace.gate: 'Portón',
  ViaShipmentDeliveryPlace.warehouse2: 'Galpón 2',
};

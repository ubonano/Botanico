enum ShipmentDeliveryPlace {
  toDefine,
  counter,
  gate,
  warehouse2,
}

String deliveryPlaceToString(ShipmentDeliveryPlace place) => place.toString().split('.').last;

ShipmentDeliveryPlace deliveryPlaceFromString(String placeString) =>
    ShipmentDeliveryPlace.values.firstWhere((place) => deliveryPlaceToString(place) == placeString);

final Map<ShipmentDeliveryPlace, String> deliveryPlaceLabels = {
  ShipmentDeliveryPlace.toDefine: 'A definir',
  ShipmentDeliveryPlace.counter: 'Mostrador',
  ShipmentDeliveryPlace.gate: 'Portón',
  ShipmentDeliveryPlace.warehouse2: 'Galpón 2',
};

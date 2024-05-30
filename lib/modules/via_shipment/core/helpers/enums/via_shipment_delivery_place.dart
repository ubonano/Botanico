enum DeliveryPlace {
  toDefine,
  counter,
  gate,
  warehouse2,
}

String deliveryPlaceToString(DeliveryPlace place) => place.toString().split('.').last;

DeliveryPlace deliveryPlaceFromString(String placeString) =>
    DeliveryPlace.values.firstWhere((place) => deliveryPlaceToString(place) == placeString);

final Map<DeliveryPlace, String> deliveryPlaceLabels = {
  DeliveryPlace.toDefine: 'A definir',
  DeliveryPlace.counter: 'Mostrador',
  DeliveryPlace.gate: 'Portón',
  DeliveryPlace.warehouse2: 'Galpón 2',
};

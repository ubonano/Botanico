enum DeliveryPlace {
  aDefinir,
  mostrador,
  porton,
  galpon2,
}

String deliveryPlaceToString(DeliveryPlace place) {
  return place.toString().split('.').last;
}

DeliveryPlace deliveryPlaceFromString(String placeString) {
  return DeliveryPlace.values.firstWhere(
    (place) => deliveryPlaceToString(place) == placeString,
  );
}

final Map<DeliveryPlace, String> deliveryPlaceLabels = {
  DeliveryPlace.aDefinir: 'A definir',
  DeliveryPlace.mostrador: 'Mostrador',
  DeliveryPlace.porton: 'Portón',
  DeliveryPlace.galpon2: 'Galpón 2',
};


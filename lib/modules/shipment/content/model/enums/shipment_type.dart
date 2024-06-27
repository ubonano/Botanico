import 'package:flutter/material.dart';

enum ShipmentType {
  delivery,
  dispatch,
}

String shipmentTypeToString(ShipmentType type) => type.toString().split('.').last;

ShipmentType shipmentTypeFromString(String typeString) =>
    ShipmentType.values.firstWhere((type) => shipmentTypeToString(type) == typeString);

final Map<ShipmentType, String> shipmentTypeLabels = {
  ShipmentType.delivery: 'Entrega',
  ShipmentType.dispatch: 'Despacho',
};

Color shipmentTypeToColor(ShipmentType type) {
  switch (type) {
    case ShipmentType.delivery:
      return Colors.red;
    case ShipmentType.dispatch:
      return Colors.green;
    default:
      return Colors.black;
  }
}

const Map<ShipmentType, IconData> shipmentTypeIcons = {
  ShipmentType.delivery: Icons.outbox,
  ShipmentType.dispatch: Icons.inbox,
};

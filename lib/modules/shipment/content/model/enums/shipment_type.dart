import 'package:flutter/material.dart';

enum ViaShipmentType {
  delivery,
  dispatch,
}

String shipmentTypeToString(ViaShipmentType type) => type.toString().split('.').last;

ViaShipmentType shipmentTypeFromString(String typeString) =>
    ViaShipmentType.values.firstWhere((type) => shipmentTypeToString(type) == typeString);

final Map<ViaShipmentType, String> shipmentTypeLabels = {
  ViaShipmentType.delivery: 'Entrega',
  ViaShipmentType.dispatch: 'Despacho',
};

Color viaShipmentTypeToColor(ViaShipmentType type) {
  switch (type) {
    case ViaShipmentType.delivery:
      return Colors.red;
    case ViaShipmentType.dispatch:
      return Colors.green;
    default:
      return Colors.black;
  }
}

const Map<ViaShipmentType, IconData> shipmentTypeIcons = {
  ViaShipmentType.delivery: Icons.outbox,
  ViaShipmentType.dispatch: Icons.inbox,
};

import 'package:flutter/material.dart';

enum ViaShipmentType {
  delivery,
  dispatch,
}

String viaShipmentTypeToString(ViaShipmentType type) => type.toString().split('.').last;

ViaShipmentType viaShipmentTypeFromString(String typeString) =>
    ViaShipmentType.values.firstWhere((type) => viaShipmentTypeToString(type) == typeString);

final Map<ViaShipmentType, String> viaShipmentTypeLabels = {
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

const Map<ViaShipmentType, IconData> viaShipmentTypeIcons = {
  ViaShipmentType.delivery: Icons.outbox,
  ViaShipmentType.dispatch: Icons.inbox,
};

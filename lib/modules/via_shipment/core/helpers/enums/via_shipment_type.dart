import 'package:flutter/material.dart';

enum ViaShipmentType {
  entrega,
  despacho,
}

String viaShipmentTypeToString(ViaShipmentType type) {
  return type.toString().split('.').last;
}

ViaShipmentType viaShipmentTypeFromString(String typeString) {
  return ViaShipmentType.values.firstWhere(
    (type) => viaShipmentTypeToString(type) == typeString,
  );
}

final Map<ViaShipmentType, String> viaShipmentTypeLabels = {
  ViaShipmentType.entrega: 'Entrega',
  ViaShipmentType.despacho: 'Despacho',
};

Color viaShipmentTypeToColor(ViaShipmentType type) {
  switch (type) {
    case ViaShipmentType.entrega:
      return Colors.red; // Color óptimo para pendiente
    case ViaShipmentType.despacho:
      return Colors.green; // Color óptimo para procesando
    default:
      return Colors.black; // Color por defecto
  }
}

const Map<ViaShipmentType, IconData> viaShipmentTypeIcons = {
  ViaShipmentType.entrega: Icons.outbox,
  ViaShipmentType.despacho: Icons.inbox,
};

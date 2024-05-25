import 'package:flutter/material.dart';

enum ViaShipmentState {
  pendiente,
  procesando,
  lista,
  entregada,
  archivada,
}

String viaShipmentStateToString(ViaShipmentState state) {
  return state.toString().split('.').last;
}

ViaShipmentState viaShipmentStateFromString(String stateString) {
  return ViaShipmentState.values.firstWhere(
    (state) => viaShipmentStateToString(state) == stateString,
  );
}

final Map<ViaShipmentState, String> viaShipmentStateLabels = {
  ViaShipmentState.pendiente: 'Pendiente',
  ViaShipmentState.procesando: 'Procesando',
  ViaShipmentState.lista: 'Lista',
  ViaShipmentState.entregada: 'Entregada',
  ViaShipmentState.archivada: 'Archivada',
};

Color viaShipmentStateToColor(ViaShipmentState state) {
  switch (state) {
    case ViaShipmentState.pendiente:
      return Colors.orange; // Color óptimo para pendiente
    case ViaShipmentState.procesando:
      return Colors.blue; // Color óptimo para procesando
    case ViaShipmentState.lista:
      return Colors.yellow; // Color óptimo para lista
    case ViaShipmentState.entregada:
      return Colors.green; // Color óptimo para entregada
    case ViaShipmentState.archivada:
      return Colors.grey; // Color óptimo para archivada
    default:
      return Colors.black; // Color por defecto
  }
}

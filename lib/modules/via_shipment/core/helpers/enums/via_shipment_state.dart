import 'package:flutter/material.dart';

enum ViaShipmentState {
  pending(1),
  processing(2),
  ready(3),
  delivered(4),
  archived(5);

  final int value;
  const ViaShipmentState(this.value);
}

String viaShipmentStateToString(ViaShipmentState state) => state.toString().split('.').last;

ViaShipmentState viaShipmentStateFromString(String stateString) =>
    ViaShipmentState.values.firstWhere((state) => viaShipmentStateToString(state) == stateString);

final Map<ViaShipmentState, String> viaShipmentStateLabels = {
  ViaShipmentState.pending: 'Pendiente',
  ViaShipmentState.processing: 'Procesando',
  ViaShipmentState.ready: 'Lista',
  ViaShipmentState.delivered: 'Entregada',
  ViaShipmentState.archived: 'Archivada',
};

Color viaShipmentStateToColor(ViaShipmentState state) {
  switch (state) {
    case ViaShipmentState.pending:
      return Colors.orange;
    case ViaShipmentState.processing:
      return Colors.blue;
    case ViaShipmentState.ready:
      return Colors.yellow;
    case ViaShipmentState.delivered:
      return Colors.green;
    case ViaShipmentState.archived:
      return Colors.grey;
    default:
      return Colors.black;
  }
}

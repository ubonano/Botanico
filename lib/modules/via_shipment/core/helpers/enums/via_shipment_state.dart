import 'package:flutter/material.dart';

enum ViaShipmentState {
  pending(0),
  inProcess(1),
  ready(2),
  delivered(3),
  archived(4);

  final int value;
  const ViaShipmentState(this.value);
}

String viaShipmentStateToString(ViaShipmentState state) => state.toString().split('.').last;

ViaShipmentState viaShipmentStateFromString(String stateString) =>
    ViaShipmentState.values.firstWhere((state) => viaShipmentStateToString(state) == stateString);

final Map<ViaShipmentState, String> viaShipmentStateLabels = {
  ViaShipmentState.pending: 'Pendiente',
  ViaShipmentState.inProcess: 'Procesando',
  ViaShipmentState.ready: 'Lista',
  ViaShipmentState.delivered: 'Entregada',
  ViaShipmentState.archived: 'Archivada',
};

Color viaShipmentStateToColor(ViaShipmentState state) {
  switch (state) {
    case ViaShipmentState.pending:
      return Colors.orange;
    case ViaShipmentState.inProcess:
      return Colors.blue;
    case ViaShipmentState.ready:
      return Colors.green;
    case ViaShipmentState.delivered:
      return Colors.grey;
    case ViaShipmentState.archived:
      return Colors.red;
    default:
      return Colors.black;
  }
}

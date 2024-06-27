import 'package:flutter/material.dart';

enum ShipmentState {
  pending(0),
  inProcess(1),
  ready(2),
  delivered(3),
  archived(4);

  final int value;
  const ShipmentState(this.value);
}

String shipmentStateToString(ShipmentState state) => state.toString().split('.').last;

ShipmentState shipmentStateFromString(String stateString) =>
    ShipmentState.values.firstWhere((state) => shipmentStateToString(state) == stateString);

final Map<ShipmentState, String> shipmentStateLabels = {
  ShipmentState.pending: 'Pendiente',
  ShipmentState.inProcess: 'Procesando',
  ShipmentState.ready: 'Lista',
  ShipmentState.delivered: 'Entregada',
  ShipmentState.archived: 'Archivada',
};

Color shipmentStateToColor(ShipmentState state) {
  switch (state) {
    case ShipmentState.pending:
      return Colors.orange;
    case ShipmentState.inProcess:
      return Colors.blue;
    case ShipmentState.ready:
      return Colors.green;
    case ShipmentState.delivered:
      return Colors.grey;
    case ShipmentState.archived:
      return Colors.red;
    default:
      return Colors.black;
  }
}

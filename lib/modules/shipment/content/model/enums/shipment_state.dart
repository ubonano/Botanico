import 'package:flutter/material.dart';

enum ShipmentState {
  pending(0, 'Pendiente', Colors.orange),
  inProcess(1, 'Procesando', Colors.blue),
  ready(2, 'Lista', Colors.green),
  delivered(3, 'Entregada', Colors.grey),
  archived(4, 'Archivada', Colors.red),
  canceled(5, 'Cancelada', Colors.purple);

  final int value;
  final String label;
  final Color color;

  const ShipmentState(this.value, this.label, this.color);

  String toShortString() => toString().split('.').last;
}

ShipmentState shipmentStateFromString(String stateString) =>
    ShipmentState.values.firstWhere((state) => state.toShortString() == stateString);

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


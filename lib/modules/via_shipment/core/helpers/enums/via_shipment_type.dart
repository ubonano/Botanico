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

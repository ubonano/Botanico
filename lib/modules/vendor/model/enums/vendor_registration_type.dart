enum VendorRegistrationType {
  monotributo,
  responsableInscripto,
  consumidorFinal,
  exento,
}

String vendorRegistrationTypeToString(VendorRegistrationType type) {
  return type.toString().split('.').last;
}

VendorRegistrationType vendorRegistrationTypeFromString(String typeString) {
  return VendorRegistrationType.values.firstWhere(
    (type) => vendorRegistrationTypeToString(type) == typeString,
  );
}

final Map<VendorRegistrationType, String> vendorRegistrationTypeLabels = {
  VendorRegistrationType.monotributo: 'Monotributo',
  VendorRegistrationType.responsableInscripto: 'Responsable inscripto',
  VendorRegistrationType.consumidorFinal: 'Consumidor final',
  VendorRegistrationType.exento: 'Exento',
};

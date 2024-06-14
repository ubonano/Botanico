import 'package:flutter/material.dart';
import '../../../../../module.dart';

class ShipmentTypeWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ShipmentTypeWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(
      icon: viaShipmentTypeIcons[viaShipmentTypeFromString(shipment.type)]!,
      text: viaShipmentTypeLabels[viaShipmentTypeFromString(shipment.type)]!,
      iconColor: viaShipmentTypeToColor(viaShipmentTypeFromString(shipment.type)),
    );
  }
}

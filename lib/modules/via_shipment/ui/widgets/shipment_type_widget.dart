import 'package:flutter/material.dart';
import '../../module.dart';

class ShipmentTypeWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ShipmentTypeWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(
      icon: Icons.local_shipping,
      text: viaShipmentTypeLabels[viaShipmentTypeFromString(shipment.type)]!,
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../module.dart';

class ShipmentIdWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ShipmentIdWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(
      icon: Icons.numbers,
      text: shipment.shipmentId,
      boldText: shipment.shipmentId.length >= 4 ? shipment.shipmentId.substring(shipment.shipmentId.length - 4) : null,
    );
  }
}

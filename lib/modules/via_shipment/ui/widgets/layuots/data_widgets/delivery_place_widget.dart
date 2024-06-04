import 'package:flutter/material.dart';
import '../../../../module.dart';

class DeliveryPlaceWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const DeliveryPlaceWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(icon: Icons.place, text: deliveryPlaceLabels[deliveryPlaceFromString(shipment.deliveryPlace)]!);
  }
}

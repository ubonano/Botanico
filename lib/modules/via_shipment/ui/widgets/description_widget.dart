import 'package:flutter/material.dart';
import '../../module.dart';

class DescriptionWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const DescriptionWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(icon: Icons.description, text: shipment.description);
  }
}

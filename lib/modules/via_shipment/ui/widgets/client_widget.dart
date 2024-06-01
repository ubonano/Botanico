import 'package:flutter/material.dart';
import '../../module.dart';

class ClientWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ClientWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(icon: Icons.person, text: shipment.client);
  }
}

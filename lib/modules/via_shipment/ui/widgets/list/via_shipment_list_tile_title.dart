import 'package:flutter/material.dart';

import '../../../module.dart';

class ViaShipmentListTileTitle extends StatelessWidget {
  final ViaShipmentModel viaShipment;

  const ViaShipmentListTileTitle(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildIconWithText(Icons.numbers, viaShipment.shipmentId),
        const SizedBox(width: 8),
        _buildIconWithText(Icons.person, viaShipment.client),
      ],
    );
  }

  Widget _buildIconWithText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}

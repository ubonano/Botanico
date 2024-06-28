import 'package:flutter/material.dart';

import '../../../../../../../../../content/model/shipment_model.dart';

class ShipmentStateTooltip extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentStateTooltip(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: shipment.state.label,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: shipment.state.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

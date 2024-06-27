import 'package:flutter/material.dart';

import '../../../../content/model/shipment_model.dart';

class ShipmentStateTooltip extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentStateTooltip(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: shipmentStateLabels[shipment.state]!,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: shipmentStateToColor(shipment.state),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

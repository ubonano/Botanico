import 'package:flutter/material.dart';

import '../../../module.dart';

class ViaShipmentStateTooltip extends StatelessWidget {
  final ViaShipmentModel viaShipment;

  const ViaShipmentStateTooltip(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: viaShipmentStateLabels[viaShipmentStateFromString(viaShipment.state)]!,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: viaShipmentStateToColor(viaShipmentStateFromString(viaShipment.state)),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

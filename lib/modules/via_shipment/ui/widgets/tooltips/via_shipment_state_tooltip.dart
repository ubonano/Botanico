import 'package:flutter/material.dart';

import '../../../module.dart';

class ViaShipmentStateTooltip extends StatelessWidget {
  final ViaShipmentModel viaShipment;

  const ViaShipmentStateTooltip(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    final state = ViaShipmentState.values[viaShipment.state];
    return Tooltip(
      message: viaShipmentStateLabels[state]!,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: viaShipmentStateToColor(state),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

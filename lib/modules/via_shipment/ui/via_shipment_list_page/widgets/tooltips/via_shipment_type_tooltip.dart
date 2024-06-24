import 'package:flutter/material.dart';

import '../../../../content/model/via_shipment_model.dart';

class ViaShipmentTypeTooltip extends StatelessWidget {
  final ViaShipmentModel viaShipment;

  const ViaShipmentTypeTooltip(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: viaShipmentTypeLabels[viaShipmentTypeFromString(viaShipment.type)]!,
      child: Icon(viaShipmentTypeIcons[viaShipmentTypeFromString(viaShipment.type)]),
    );
  }
}

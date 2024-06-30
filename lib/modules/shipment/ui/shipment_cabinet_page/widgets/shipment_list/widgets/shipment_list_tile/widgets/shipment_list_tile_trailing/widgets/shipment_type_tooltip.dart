import 'package:flutter/material.dart';

import '../../../../../../../../../setup/model/shipment_model.dart';

class ShipmentTypeTooltip extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentTypeTooltip(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: shipmentTypeLabels[shipmentTypeFromString(shipment.type)]!,
      child: Icon(shipmentTypeIcons[shipmentTypeFromString(shipment.type)]),
    );
  }
}

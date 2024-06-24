import 'package:flutter/material.dart';
import '../../../content/model/via_shipment_model.dart';
import '../../ui.dart';

class ViaShipmentListTileTrailing extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ViaShipmentListTileTrailing(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViaShipmentStateTooltip(shipment),
        const SizedBox(width: 10),
        ViaShipmentTypeTooltip(shipment),
        const SizedBox(width: 10),
        ViaShipmentInvoicedTooltip(shipment),
        const SizedBox(width: 30),
        ViaShipmentListTileTrailingIconButtons(shipment),
      ],
    );
  }
}

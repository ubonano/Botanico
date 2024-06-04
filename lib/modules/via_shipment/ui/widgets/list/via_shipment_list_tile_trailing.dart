import 'package:flutter/material.dart';
import '../tooltips/via_shipment_state_tooltip.dart';
import '../tooltips/via_shipment_type_tooltip.dart';
import '../tooltips/via_shipment_invoiced_tooltip.dart';
import '../../../module.dart';

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

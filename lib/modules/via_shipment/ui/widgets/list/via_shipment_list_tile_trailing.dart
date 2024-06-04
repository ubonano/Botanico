import 'package:flutter/material.dart';
import '../tooltips/via_shipment_state_tooltip.dart';
import '../tooltips/via_shipment_type_tooltip.dart';
import '../tooltips/via_shipment_invoiced_tooltip.dart';
import '../../../module.dart';

class ViaShipmentListTileTrailing extends StatelessWidget {
  final ViaShipmentModel viaShipment;

  const ViaShipmentListTileTrailing(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViaShipmentStateTooltip(viaShipment),
        const SizedBox(width: 10),
        ViaShipmentTypeTooltip(viaShipment),
        const SizedBox(width: 10),
        ViaShipmentInvoicedTooltip(viaShipment),
        const SizedBox(width: 30),
        ViaShipmentListTileTrailingIconButtons(viaShipment),
      ],
    );
  }
}

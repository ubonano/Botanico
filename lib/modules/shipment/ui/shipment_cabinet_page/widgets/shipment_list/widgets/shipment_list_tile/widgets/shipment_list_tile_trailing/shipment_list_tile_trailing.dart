import 'package:flutter/material.dart';
import '../../../../../../../../setup/model/shipment_model.dart';
import '../../../../../../../ui.dart';

class ShipmentListTileTrailing extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentListTileTrailing(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShipmentStateTooltip(shipment),
        const SizedBox(width: 10),
        ShipmentTypeTooltip(shipment),
        const SizedBox(width: 10),
        ShipmentInvoicedTooltip(shipment),
        const SizedBox(width: 30),
        ShipmentListTileTrailingIconButtons(shipment),
      ],
    );
  }
}

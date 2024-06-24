import 'package:flutter/material.dart';

import '../../../content/model/via_shipment_model.dart';
import '../../ui.dart';

class ViaShipmentListTileTitle extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ViaShipmentListTileTitle(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShipmentIdWidget(shipment),
        ClientWidget(shipment),
      ],
    );
  }
}

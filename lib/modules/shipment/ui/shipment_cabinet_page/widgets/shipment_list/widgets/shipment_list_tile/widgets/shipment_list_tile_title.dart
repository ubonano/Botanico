import 'package:flutter/material.dart';

import '../../../../../../../setup/model/shipment_model.dart';
import '../../../../../../ui.dart';

class ShipmentListTileTitle extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentListTileTitle(this.shipment, {super.key});

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

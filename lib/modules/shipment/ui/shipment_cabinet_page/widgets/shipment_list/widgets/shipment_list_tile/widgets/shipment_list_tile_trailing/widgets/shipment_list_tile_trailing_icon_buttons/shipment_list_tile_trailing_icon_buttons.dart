import 'package:flutter/material.dart';

import '../../../../../../../../../../setup/model/shipment_model.dart';
import '../../../../../../../../../ui.dart';

class ShipmentListTileTrailingIconButtons extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentListTileTrailingIconButtons(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShipmentDeleteIconButton(shipment),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../setup/model/shipment_model.dart';
import '../../../../../ui.dart';

class ShipmentListTile extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentListTile(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ShipmentListTileTitle(shipment),
      trailing: ShipmentListTileTrailing(shipment),
      onTap: () => ShipmentFormPage.navigate(argument: shipment.id, canPop: true),
    );
  }
}

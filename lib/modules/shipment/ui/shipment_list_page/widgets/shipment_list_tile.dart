import 'package:flutter/material.dart';

import '../../../../app/content/setup/navigation.dart';
import '../../../content/model/shipment_model.dart';
import '../../ui.dart';

class ShipmentListTile extends StatelessWidget with NavigationHelperInstance {
  final ShipmentModel shipment;

  ShipmentListTile(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ShipmentListTileTitle(shipment),
      trailing: ShipmentListTileTrailing(shipment),
      onTap: () => navigate.toShipmentForm(id: shipment.id, canPop: true),
    );
  }
}

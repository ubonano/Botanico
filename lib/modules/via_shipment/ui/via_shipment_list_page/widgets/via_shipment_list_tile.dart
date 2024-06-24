import 'package:flutter/material.dart';

import '../../../../app/content/setup/navigation.dart';
import '../../../content/model/via_shipment_model.dart';
import '../../ui.dart';

class ViaShipmentListTile extends StatelessWidget with NavigationHelperInstance {
  final ViaShipmentModel shipment;

  ViaShipmentListTile(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ViaShipmentListTileTitle(shipment),
      trailing: ViaShipmentListTileTrailing(shipment),
      onTap: () => navigate.toViaShipmentForm(id: shipment.id, canPop: true),
    );
  }
}

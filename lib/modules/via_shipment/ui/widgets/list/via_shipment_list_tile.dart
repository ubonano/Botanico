import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class ViaShipmentListTile extends StatelessWidget with NavigationHelperInstance {
  final ViaShipmentModel viaShipment;

  ViaShipmentListTile(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ViaShipmentListTileTitle(viaShipment),
      trailing: ViaShipmentListTileTrailing(viaShipment),
      onTap: () => navigate.toViaShipmentForm(id: viaShipment.id, canPop: true),
    );
  }
}

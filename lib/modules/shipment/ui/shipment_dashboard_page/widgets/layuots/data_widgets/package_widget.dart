import 'package:flutter/material.dart';

import '../../../../../setup/model/shipment_model.dart';
import '../../../../ui.dart';

class PackageWidget extends StatelessWidget {
  final ShipmentModel shipment;

  const PackageWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(icon: Icons.inventory, text: shipment.package);
  }
}

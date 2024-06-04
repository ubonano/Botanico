import 'package:flutter/material.dart';
import '../../module.dart';

class PackageWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const PackageWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(icon: Icons.inventory, text: shipment.package);
  }
}

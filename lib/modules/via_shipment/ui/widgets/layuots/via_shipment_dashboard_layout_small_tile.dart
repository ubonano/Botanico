import 'package:flutter/material.dart';

import '../../../module.dart';

class ViaShipmentDashboardLayoutSmallTile extends StatelessWidget {
  final ViaShipmentModel shipment;
  final Animation<Color?> colorAnimation;

  const ViaShipmentDashboardLayoutSmallTile(this.shipment, this.colorAnimation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: shipment.isPending ? colorAnimation.value : Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: ShipmentIdWidget(shipment)),
                Flexible(child: ShipmentTypeWidget(shipment)),
                Flexible(child: InvoicedWidget(shipment)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: PackageWidget(shipment)),
                Flexible(child: WeightWidget(shipment)),
                Flexible(child: DeliveryPlaceWidget(shipment)),
              ],
            ),
            DescriptionWidget(shipment),
            ClientWidget(shipment),
            StateWidget(shipment)
          ],
        ),
      ),
    );
  }
}

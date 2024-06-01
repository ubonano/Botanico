import 'package:flutter/material.dart';

import '../../../module.dart';

class ViaShipmentDashboardLayoutLargeTile extends StatelessWidget {
  final ViaShipmentModel shipment;
  final Animation<Color?> colorAnimation;

  const ViaShipmentDashboardLayoutLargeTile(this.shipment, this.colorAnimation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: shipment.isPending ? colorAnimation.value : Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(100.0), // shipmentId
            1: FixedColumnWidth(100.0), // type
            2: FixedColumnWidth(100.0), // client
            3: FixedColumnWidth(100.0), // package
            4: FixedColumnWidth(100.0), // weight
            5: FixedColumnWidth(100.0), // description
            6: FixedColumnWidth(100.0), // state
            7: FixedColumnWidth(100.0), // invoiced
            8: FixedColumnWidth(100.0), // deliveryPlace
          },
          children: [
            TableRow(
              children: [
                ShipmentIdWidget(shipment),
                ShipmentTypeWidget(shipment),
                ClientWidget(shipment),
                PackageWidget(shipment),
                WeightWidget(shipment),
                DescriptionWidget(shipment),
                StateWidget(shipment),
                InvoicedWidget(shipment),
                DeliveryPlaceWidget(shipment),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

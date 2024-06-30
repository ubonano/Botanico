import 'package:flutter/material.dart';

import '../../../../setup/model/shipment_model.dart';
import '../../../ui.dart';

class ShipmentDashboardLayoutLargeTile extends StatelessWidget {
  final ShipmentModel shipment;
  final Animation<Color?> colorAnimation;

  const ShipmentDashboardLayoutLargeTile(this.shipment, this.colorAnimation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(200.0), // shipmentId
        1: FixedColumnWidth(100.0), // type
        2: FixedColumnWidth(100.0), // client
        3: FixedColumnWidth(50.0), // package
        4: FixedColumnWidth(50.0), // weight
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
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../content/model/shipment_model.dart';

class ShipmentInvoicedTooltip extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentInvoicedTooltip(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: shipment.isInvoiced ? 'Facturado' : 'No Facturado',
      child: Icon(
        shipment.isInvoiced ? Icons.check_circle : Icons.cancel,
        color: shipment.isInvoiced ? Colors.green : Colors.red,
      ),
    );
  }
}

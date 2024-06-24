import 'package:flutter/material.dart';

import '../../../../../content/model/via_shipment_model.dart';
import '../../../../ui.dart';

class InvoicedWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const InvoicedWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(
      icon: Icons.receipt,
      text: shipment.isInvoiced ? 'Facturado' : 'No facturado',
      iconColor: shipment.isInvoiced ? Colors.green : Colors.red,
    );
  }
}

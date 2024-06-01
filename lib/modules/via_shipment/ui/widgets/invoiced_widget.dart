import 'package:flutter/material.dart';
import '../../module.dart';

class InvoicedWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const InvoicedWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(icon: Icons.receipt, text: shipment.isInvoiced ? 'Sí' : 'No');
  }
}

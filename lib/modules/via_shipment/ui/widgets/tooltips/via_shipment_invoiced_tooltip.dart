import 'package:flutter/material.dart';

import '../../../module.dart';

class ViaShipmentInvoicedTooltip extends StatelessWidget {
  final ViaShipmentModel viaShipment;

  const ViaShipmentInvoicedTooltip(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: viaShipment.isInvoiced ? 'Facturado' : 'No Facturado',
      child: Icon(
        viaShipment.isInvoiced ? Icons.check_circle : Icons.cancel,
        color: viaShipment.isInvoiced ? Colors.green : Colors.red,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../module.dart';

class CancelInvoiceSlidableButton extends GetView<ViaShipmentCancelInvoiceController> {
  final ViaShipmentModel viaShipment;

  const CancelInvoiceSlidableButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await controller.submit(viaShipment),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.cancel,
      label: 'Cancelar Factura',
    );
  }
}

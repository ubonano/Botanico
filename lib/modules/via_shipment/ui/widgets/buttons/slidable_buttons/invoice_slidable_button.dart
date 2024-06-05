import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../module.dart';

class InvoiceSlidableButton extends StatelessWidget {
  final ViaShipmentModel shipment;

  const InvoiceSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IViaShipmentService>().invoice(shipment),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      icon: Icons.receipt,
      label: 'Facturar',
    );
  }
}

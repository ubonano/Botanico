import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../content/setup/interfaces/i_via_shipment_service.dart';

class CancelInvoiceSlidableButton extends StatelessWidget {
  final ViaShipmentModel shipment;

  const CancelInvoiceSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IViaShipmentService>().cancelInvoice(shipment),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.cancel,
      label: 'Cancelar Factura',
    );
  }
}

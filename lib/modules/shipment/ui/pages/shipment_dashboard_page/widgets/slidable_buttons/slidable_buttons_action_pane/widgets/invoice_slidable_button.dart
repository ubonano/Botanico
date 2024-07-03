import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../../setup/interfaces/i_shipment_service.dart';

class InvoiceSlidableButton extends StatelessWidget {
  final ShipmentModel shipment;

  const InvoiceSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IShipmentService>().invoice(shipment),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      icon: Icons.receipt,
      label: 'Facturar',
    );
  }
}

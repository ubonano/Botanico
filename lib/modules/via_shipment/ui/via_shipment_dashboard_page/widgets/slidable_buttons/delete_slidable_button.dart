import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../content/setup/interfaces/i_via_shipment_service.dart';

class DeleteSlidableButton extends StatelessWidget {
  final ViaShipmentModel shipment;

  const DeleteSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IViaShipmentService>().delete(shipment),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: 'Eliminar',
    );
  }
}

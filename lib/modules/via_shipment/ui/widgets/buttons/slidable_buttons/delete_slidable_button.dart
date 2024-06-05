import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../module.dart';

class DeleteSlidableButton extends StatelessWidget {
  final ViaShipmentModel shipment;

  const DeleteSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    late final IViaShipmentService service = Get.find();

    return SlidableAction(
      onPressed: (context) async => await service.delete(shipment.id),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: 'Eliminar',
    );
  }
}

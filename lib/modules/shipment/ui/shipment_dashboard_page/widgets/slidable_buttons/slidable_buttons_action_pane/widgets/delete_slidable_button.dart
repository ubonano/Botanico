import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../setup/interfaces/i_shipment_service.dart';

class DeleteSlidableButton extends StatelessWidget {
  final ShipmentModel shipment;

  const DeleteSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IShipmentService>().delete(shipment),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: 'Eliminar',
    );
  }
}

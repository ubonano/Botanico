import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../content/setup/interfaces/i_via_shipment_service.dart';

class DeliverSlidableButton extends StatelessWidget {
  final ViaShipmentModel shipment;

  const DeliverSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IViaShipmentService>().deliver(shipment),
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
      icon: Icons.check_circle,
      label: 'Entregar',
    );
  }
}

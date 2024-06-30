import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../setup/interfaces/i_shipment_service.dart';

class DeliverSlidableButton extends StatelessWidget {
  final ShipmentModel shipment;

  const DeliverSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IShipmentService>().deliver(shipment),
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
      icon: Icons.check_circle,
      label: 'Entregar',
    );
  }
}

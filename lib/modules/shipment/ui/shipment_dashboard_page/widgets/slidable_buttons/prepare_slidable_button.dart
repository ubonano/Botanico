import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../content/setup/interfaces/i_shipment_service.dart';

class PrepareSlidableButton extends StatelessWidget {
  final ShipmentModel shipment;

  const PrepareSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IShipmentService>().prepare(shipment),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      icon: Icons.check_circle,
      label: 'Lista',
    );
  }
}

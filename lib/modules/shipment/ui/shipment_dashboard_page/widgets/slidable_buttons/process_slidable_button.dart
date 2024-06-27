import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../content/setup/interfaces/i_shipment_service.dart';

class ProcessSlidableButton extends StatelessWidget {
  final ShipmentModel shipment;

  const ProcessSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IShipmentService>().process(shipment),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      icon: Icons.engineering,
      label: 'Procesar',
    );
  }
}

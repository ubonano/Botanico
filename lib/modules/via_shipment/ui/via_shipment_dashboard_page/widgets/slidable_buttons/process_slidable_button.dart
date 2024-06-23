import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../setup/interfaces/i_via_shipment_service.dart';

class ProcessSlidableButton extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ProcessSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IViaShipmentService>().process(shipment),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      icon: Icons.engineering,
      label: 'Procesar',
    );
  }
}

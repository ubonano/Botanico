import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../module.dart';

class PrepareSlidableButton extends StatelessWidget {
  final ViaShipmentModel shipment;

  const PrepareSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IViaShipmentService>().prepare(shipment),
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.white,
      icon: Icons.check_circle,
      label: 'Lista',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../../setup/interfaces/i_shipment_service.dart';

class CancelSlidableButton extends StatelessWidget {
  final ShipmentModel shipment;

  const CancelSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IShipmentService>().cancel(shipment),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.cancel,
      label: 'Cancelar',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class DeliverSlidableButton extends GetView<ViaShipmentStateController> {
  final ViaShipmentModel viaShipment;

  const DeliverSlidableButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: ViaShipmentModulePermissions.deliverKey,
      child: SlidableAction(
        onPressed: (context) async => await controller.deliver(viaShipment),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: Icons.check_circle,
        label: 'Entregar',
      ),
    );
  }
}

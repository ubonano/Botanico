import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class ProcessSlidableButton extends GetView<ViaShipmentStateController> {
  final ViaShipmentModel viaShipment;

  const ProcessSlidableButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: ViaShipmentModulePermissions.processKey,
      child: SlidableAction(
        onPressed: (context) async => await controller.process(viaShipment),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        icon: Icons.engineering,
        label: 'Procesar',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../module.dart';

class ArchiveSlidableButton extends GetView<ViaShipmentStateController> {
  final ViaShipmentModel viaShipment;

  const ArchiveSlidableButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await controller.archive(viaShipment),
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
      icon: Icons.archive,
      label: 'Archivar',
    );
  }
}

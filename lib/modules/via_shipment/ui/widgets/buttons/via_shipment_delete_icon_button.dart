import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class ViaShipmentDeleteIconButton extends GetView<ViaShipmentDeleteController> {
  final ViaShipmentModel viaShipment;

  const ViaShipmentDeleteIconButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: ViaShipmentModulePermissions.deleteKey,
      child: IconButton(
        key: key ?? const Key('ViaShipmentDeleteIconButton'),
        icon: const Icon(Icons.delete),
        onPressed: () => ConfirmationDialog.show(
          context,
          content: 'Are you sure you want to delete this via shipment?',
          onConfirm: () => controller.submit(viaShipment),
        ),
      ),
    );
  }
}

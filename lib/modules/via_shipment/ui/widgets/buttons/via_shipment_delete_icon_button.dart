import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class ViaShipmentDeleteIconButton extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ViaShipmentDeleteIconButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: ViaShipmentModulePermissions.deleteKey,
      child: IconButton(
        key: key ?? const Key('ViaShipmentDeleteIconButton'),
        icon: const Icon(Icons.delete),
        onPressed: () => ConfirmationDialog.show(
          context,
          content: '¿Estás seguro de que deseas eliminar este envío?',
          onConfirm: () => Get.find<IViaShipmentService>().delete(shipment),
        ),
      ),
    );
  }
}

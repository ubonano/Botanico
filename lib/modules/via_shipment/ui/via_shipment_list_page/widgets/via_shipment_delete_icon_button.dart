import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../content/setup/interfaces/i_via_shipment_service.dart';
import '../../../content/setup/permissions.dart';

class ViaShipmentDeleteIconButton extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ViaShipmentDeleteIconButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ViaShipmentPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.deleteKey,
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

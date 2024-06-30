import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../../app/ui/ui.dart';
import '../../../../../../../../../../../setup/interfaces/i_shipment_service.dart';
import '../../../../../../../../../../../setup/permissions.dart';

class ShipmentDeleteIconButton extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentDeleteIconButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ShipmentPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.deleteKey,
      child: IconButton(
        key: key ?? const Key('ShipmentDeleteIconButton'),
        icon: const Icon(Icons.delete),
        onPressed: () => ConfirmationDialog.show(
          context,
          content: '¿Estás seguro de que deseas eliminar este envío?',
          onConfirm: () => Get.find<IShipmentService>().delete(shipment),
        ),
      ),
    );
  }
}

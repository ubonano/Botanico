import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:botanico/modules/foundation/ui/widgets/protected_widget.dart';
import 'package:get/get.dart';

import '../../../module.dart';

class CancelInvoiceSlidableButton extends GetView<ViaShipmentToggleInvoicedController> {
  final ViaShipmentModel viaShipment;

  const CancelInvoiceSlidableButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: ViaShipmentModulePermissions.cancelInvoiceKey,
      child: SlidableAction(
        onPressed: (context) async => await controller.cancelInvoiceShipment(viaShipment),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.cancel,
        label: 'Cancelar Factura',
      ),
    );
  }
}

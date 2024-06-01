import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../../module.dart';

class InvoiceSlidableButton extends GetView<ViaShipmentInvoiceController> {
  final ViaShipmentModel viaShipment;

  const InvoiceSlidableButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: ViaShipmentModulePermissions.invoiceKey,
      child: SlidableAction(
        onPressed: (context) async => await controller.submit(viaShipment),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: Icons.receipt,
        label: 'Facturar',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../../../module.dart';

class ShipmentIdWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const ShipmentIdWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: shipment.shipmentId));
        Get.find<SnackbarHelper>().info('Guia copiada!', duration: const Duration(seconds: 1));
      },
      child: IconWithText(
        icon: Icons.numbers,
        text: shipment.shipmentId,
        boldText:
            shipment.shipmentId.length >= 4 ? shipment.shipmentId.substring(shipment.shipmentId.length - 4) : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:get/get.dart';

import '../../../../../model/via_shipment_model.dart';
import '../../../../ui.dart';

class DescriptionWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const DescriptionWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: shipment.description));
        Get.find<SnackbarHelper>().info('Descripcion copiada!', duration: const Duration(seconds: 1));
      },
      child: IconWithText(icon: Icons.description, text: shipment.description),
    );
  }
}

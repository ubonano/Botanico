import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../app/content/setup/fields_key.dart';
import '../../ui.dart';

class ShipmentPasteIdButton extends GetView<ViaShipmentFormController> {
  const ShipmentPasteIdButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: key ?? const Key('ShipmentPasteIdButton'),
      icon: const Icon(Icons.paste),
      onPressed: pasteShipmentId,
    );
  }

  void pasteShipmentId() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    controller.setFieldValue(FieldKeys.shipmentId, data?.text ?? '');
  }
}

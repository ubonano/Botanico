import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../module.dart';

class ShipmentIdSearchButton extends GetView<ViaShipmentFormController> {
  const ShipmentIdSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.isLoading.value
            ? const CircularProgressIndicator()
            : IconButton(
                icon: const Icon(Icons.search),
                onPressed: !controller.isUpdateModeRx.value || controller.isFieldsEnabled.value
                    ? controller.fetchShipmentDataFromExternalAPI
                    : null,
              );
      },
    );
  }
}

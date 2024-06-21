import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../../module.dart';

class TypeInputField extends StatelessWidget {
  final ViaShipmentFormController pageController;

  const TypeInputField(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final value = pageController.shipmentType.value;

        return Column(
          children: [
            DropdownButtonFormField<String>(
              key: const Key('typeField'),
              value: value.isNotEmpty ? value : viaShipmentTypeToString(ViaShipmentType.delivery),
              onChanged: pageController.isFieldsEnabled.value || !pageController.isUpdateModeRx.value
                  ? (newValue) {
                      if (newValue != null) {
                        pageController.shipmentType.value = newValue;
                      }
                    }
                  : null,
              items: ViaShipmentType.values.map(
                (ViaShipmentType type) {
                  return DropdownMenuItem<String>(
                    value: viaShipmentTypeToString(type),
                    child: Text(viaShipmentTypeLabels[type]!),
                  );
                },
              ).toList(),
              decoration: const InputDecoration(
                labelText: 'Tipo',
                border: OutlineInputBorder(),
              ),
              validator: ValidatorHelper.required,
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}

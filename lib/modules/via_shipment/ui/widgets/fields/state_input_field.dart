import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../module.dart';

class StateInputField extends StatelessWidget {
  final ViaShipmentFormController pageController;

  const StateInputField(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final value = pageController.shipmentState.value;

        return Column(
          children: [
            DropdownButtonFormField<ViaShipmentState>(
              key: const Key('stateField'),
              value: value,
              onChanged: pageController.isFieldsEnabled.value || !pageController.isUpdateModeRx.value
                  ? (newValue) {
                      if (newValue != null) {
                        pageController.shipmentState.value = newValue;
                      }
                    }
                  : null,
              items: ViaShipmentState.values.map(
                (ViaShipmentState state) {
                  return DropdownMenuItem<ViaShipmentState>(
                    value: state,
                    child: Text(viaShipmentStateLabels[state]!),
                  );
                },
              ).toList(),
              decoration: const InputDecoration(
                labelText: 'Estado',
                border: OutlineInputBorder(),
              ),
              // validator: ValidatorHelper.required,
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}

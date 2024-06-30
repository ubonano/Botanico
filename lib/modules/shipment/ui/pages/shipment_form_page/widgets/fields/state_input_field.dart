import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../setup/model/shipment_model.dart';
import '../../../../ui.dart';

class StateInputField extends StatelessWidget {
  final ShipmentFormController pageController;

  const StateInputField(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final value = pageController.shipmentState.value;

        return Column(
          children: [
            DropdownButtonFormField<ShipmentState>(
              key: const Key('stateField'),
              value: value,
              onChanged: pageController.isFieldsEnabled.value || !pageController.isUpdateModeRx.value
                  ? (newValue) {
                      if (newValue != null) {
                        pageController.shipmentState.value = newValue;
                      }
                    }
                  : null,
              items: ShipmentState.values.map(
                (ShipmentState state) {
                  return DropdownMenuItem<ShipmentState>(
                    value: state,
                    child: Text(state.label),
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

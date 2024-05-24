import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class DeliveryPlaceInputField extends StatelessWidget {
  final ViaShipmentFormController pageController;

  const DeliveryPlaceInputField(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final value = pageController.deliveryPlace.value;

        return Column(
          children: [
            DropdownButtonFormField<String>(
              key: const Key('deliveryPlaceField'),
              value: value.isNotEmpty ? value : null,
              onChanged: pageController.isFieldsEnabled.value || !pageController.isUpdateModeRx.value
                  ? (newValue) {
                      if (newValue != null) {
                        pageController.deliveryPlace.value = newValue;
                      }
                    }
                  : null,
              items: DeliveryPlace.values.map(
                (DeliveryPlace place) {
                  return DropdownMenuItem<String>(
                    value: deliveryPlaceToString(place),
                    child: Text(deliveryPlaceLabels[place]!),
                  );
                },
              ).toList(),
              decoration: const InputDecoration(
                labelText: 'Lugar de entrega',
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/content/helpers/validator_helper.dart';
import '../../../../setup/model/shipment_model.dart';
import '../../../ui.dart';

class DeliveryPlaceInputField extends StatelessWidget {
  final ShipmentFormController pageController;

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
              value: value.isNotEmpty ? value : deliveryPlaceToString(ShipmentDeliveryPlace.toDefine),
              onChanged: pageController.isFieldsEnabled.value || !pageController.isUpdateModeRx.value
                  ? (newValue) {
                      if (newValue != null) {
                        pageController.deliveryPlace.value = newValue;
                      }
                    }
                  : null,
              items: ShipmentDeliveryPlace.values.map(
                (ShipmentDeliveryPlace place) {
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

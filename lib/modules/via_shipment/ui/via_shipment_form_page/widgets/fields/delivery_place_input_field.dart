import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../../model/via_shipment_model.dart';
import '../../../ui.dart';

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
              value: value.isNotEmpty ? value : deliveryPlaceToString(ViaShipmentDeliveryPlace.toDefine),
              onChanged: pageController.isFieldsEnabled.value || !pageController.isUpdateModeRx.value
                  ? (newValue) {
                      if (newValue != null) {
                        pageController.deliveryPlace.value = newValue;
                      }
                    }
                  : null,
              items: ViaShipmentDeliveryPlace.values.map(
                (ViaShipmentDeliveryPlace place) {
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

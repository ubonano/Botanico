import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/content/helpers/validator_helper.dart';
import '../../../../setup/model/shipment_model.dart';
import '../../../ui.dart';

class TypeInputField extends StatelessWidget {
  final ShipmentFormController pageController;

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
              value: value.isNotEmpty ? value : shipmentTypeToString(ShipmentType.delivery),
              onChanged: pageController.isFieldsEnabled.value || !pageController.isUpdateModeRx.value
                  ? (newValue) {
                      if (newValue != null) {
                        pageController.shipmentType.value = newValue;
                      }
                    }
                  : null,
              items: ShipmentType.values.map(
                (ShipmentType type) {
                  return DropdownMenuItem<String>(
                    value: shipmentTypeToString(type),
                    child: Text(shipmentTypeLabels[type]!),
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

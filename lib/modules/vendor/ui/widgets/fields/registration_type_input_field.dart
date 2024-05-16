import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../../module.dart';

class RegistrationTypeInputField extends StatelessWidget {
  final VendorFormController pageController;

  const RegistrationTypeInputField(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final value = pageController.registrationType.value;

        return Column(
          children: [
            DropdownButtonFormField<String>(
              value: value.isNotEmpty ? value : null,
              onChanged: pageController.isFieldsEnabled.value || !pageController.isUpdateModeRx.value
                  ? (newValue) {
                      if (newValue != null) {
                        pageController.registrationType.value = newValue;
                      }
                    }
                  : null,
              items: VendorRegistrationType.values.map(
                (VendorRegistrationType type) {
                  return DropdownMenuItem<String>(
                    value: vendorRegistrationTypeToString(type),
                    child: Text(vendorRegistrationTypeLabels[type]!),
                  );
                },
              ).toList(),
              decoration: InputDecoration(
                labelText: 'Tipo de inscripción',
                border: const OutlineInputBorder(),
                enabled: pageController.isUpdateModeRx.value ? pageController.isFieldsEnabled.value : true,
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

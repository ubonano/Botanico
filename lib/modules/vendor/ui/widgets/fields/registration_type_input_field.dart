import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../../module.dart';

class RegistrationTypeInputField extends StatelessWidget {
  final VendorFormController pageController;

  const RegistrationTypeInputField(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final value = pageController.registrationType.value; // Use the observable variable

      return Column(
        children: [
          DropdownButtonFormField<String>(
            value: value.isNotEmpty ? value : null,
            onChanged: (newValue) {
              if (newValue != null) {
                pageController.registrationType.value = newValue; // Update the observable variable
                pageController.setFieldValue(FieldKeys.registrationType, newValue);
              }
            },
            items: VendorRegistrationType.values.map(
              (VendorRegistrationType type) {
                return DropdownMenuItem<String>(
                  value: vendorRegistrationTypeToString(type),
                  child: Text(vendorRegistrationTypeLabels[type]!),
                );
              },
            ).toList(),
            decoration: const InputDecoration(
              labelText: 'Tipo de inscripción',
              border: OutlineInputBorder(),
            ),
            validator: ValidatorHelper.required,
          ),
          const SizedBox(height: 10),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class RegistrationTypeInputField extends StatelessWidget {
  final FormHelper controller;

  const RegistrationTypeInputField(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final value = controller.getFieldValue(FieldKeys.registrationType);

    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: value.isNotEmpty ? value : null,
          onChanged: (newValue) {
            if (newValue != null) {
              controller.setFieldValue(FieldKeys.registrationType, newValue);
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
  }
}

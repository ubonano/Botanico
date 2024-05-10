import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';

class ObservationsInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const ObservationsInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.observations,
    this.onFieldSubmitted,
    this.required = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputFieldArea(
      key: key ?? const Key('observationsField'),
      label: 'Observaciones',
      minLines: 5,
      maxLines: 5,
      controller: pageController.getFieldController(fieldName)!,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

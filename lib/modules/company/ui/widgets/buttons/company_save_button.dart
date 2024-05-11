import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class CompanySaveButton extends GetView<CompanyCreateController> {
  const CompanySaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('CompanySaveButton'),
      text: 'Guardar empresa',
      onPressed: controller.secureSubmit,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class VendorSaveButton extends GetView<VendorCreateController> {
  final FormHelper pageController;

  const VendorSaveButton(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('VendorSaveButton'),
      text: 'Guardar proveedor',
      onPressed: pageController.secureSubmit,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class VendorDeleteIconButton extends GetView<VendorDeleteController> {
  final VendorModel vendor;

  const VendorDeleteIconButton(this.vendor, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: VendorModulePermissions.deleteKey,
      child: IconButton(
        key: key ?? const Key('VendorDeleteIconButton'),
        icon: const Icon(Icons.delete),
        onPressed: () => ConfirmationDialog.show(
          context,
          content: '¿Estás seguro de que quieres eliminar este proveedor?',
          onConfirm: () => controller.submit(vendor),
        ),
      ),
    );
  }
}

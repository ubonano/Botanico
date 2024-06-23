import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../setup/interfaces/i_vendor_service.dart';
import '../../../setup/permissions.dart';

class VendorDeleteIconButton extends StatelessWidget {
  final VendorModel vendor;

  const VendorDeleteIconButton(this.vendor, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.deleteKey,
      child: IconButton(
        key: key ?? const Key('VendorDeleteIconButton'),
        icon: const Icon(Icons.delete),
        onPressed: () => ConfirmationDialog.show(
          context,
          content: '¿Estás seguro de que quieres eliminar este proveedor?',
          onConfirm: () => Get.find<IVendorService>().delete(vendor),
        ),
      ),
    );
  }
}

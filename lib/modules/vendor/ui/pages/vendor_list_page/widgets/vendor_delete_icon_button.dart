import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/interfaces/i_vendor_service.dart';
import '../../../../setup/module.dart';

class VendorDeleteIconButton extends StatelessWidget {
  final VendorModel vendor;

  const VendorDeleteIconButton(this.vendor, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorModule>();

    return ProtectedWidget(
      module: module,
      permission: VendorKeys.delete.id,
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

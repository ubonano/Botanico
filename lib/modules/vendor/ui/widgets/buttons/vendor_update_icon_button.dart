import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class VendorUpdateIconButton extends GetView<VendorUpdateController> with NavigationHelperInstance {
  final VendorModel vendor;

  VendorUpdateIconButton(this.vendor, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: VendorModulePermissions.updateKey,
      child: IconButton(
        key: key ?? const Key('VendorUpdateIconButton'),
        icon: const Icon(Icons.edit),
        onPressed: () => navigate.toVendorUpdate(vendor.uid, canPop: true),
      ),
    );
  }
}

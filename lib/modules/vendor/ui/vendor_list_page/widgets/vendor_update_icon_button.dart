import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../app/content/setup/navigation.dart';
import '../../../../app/ui/ui.dart';
import '../../../content/model/vendor_model.dart';
import '../../../content/setup/permissions.dart';

class VendorUpdateIconButton extends StatelessWidget with AppNavigationInstance {
  final VendorModel vendor;

  VendorUpdateIconButton(this.vendor, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.updateKey,
      child: IconButton(
        key: key ?? const Key('VendorUpdateIconButton'),
        icon: const Icon(Icons.edit),
        onPressed: () => navigate.toVendorForm(id: vendor.uid, canPop: true),
      ),
    );
  }
}

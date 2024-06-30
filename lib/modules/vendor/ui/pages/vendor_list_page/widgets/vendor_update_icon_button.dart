import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../../app/ui/ui.dart';
import '../../../../setup/model/vendor_model.dart';
import '../../../../setup/permissions.dart';
import '../../../ui.dart';

class VendorUpdateIconButton extends StatelessWidget {
  final VendorModel vendor;

  const VendorUpdateIconButton(this.vendor, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.updateKey,
      child: IconButton(
        key: key ?? const Key('VendorUpdateIconButton'),
        icon: const Icon(Icons.edit),
        onPressed: () => VendorFormPage.navigate(argument: vendor.uid, canPop: true),
      ),
    );
  }
}

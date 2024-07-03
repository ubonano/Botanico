import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/module.dart';
import '../../../ui.dart';

class VendorCreateFAB extends StatelessWidget {
  const VendorCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorModule>();

    return ProtectedWidget(
      module: module,
      permission: VendorKeys.create.id,
      child: FloatingActionButton(
        key: key ?? const Key('VendorCreateFAB'),
        onPressed: () => VendorFormPage.navigate(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

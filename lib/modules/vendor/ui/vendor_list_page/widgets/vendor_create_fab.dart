import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../module.dart';

class VendorCreateFAB extends StatelessWidget with NavigationHelperInstance {
  VendorCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: VendorModule(),
      permission: VendorModule.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('VendorCreateFAB'),
        onPressed: () => navigate.toVendorForm(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

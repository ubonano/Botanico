import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class VendorCreateFAB extends StatelessWidget with NavigationHelperInstance {
  VendorCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: VendorModulePermissions.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('VendorCreateFAB'),
        onPressed: () => navigate.toVendorCreate(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

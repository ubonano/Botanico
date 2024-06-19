import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class ViaShipmentCreateFAB extends StatelessWidget with NavigationHelperInstance {
  ViaShipmentCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: ViaShipmentModulePermissions().toModel(),
      permission: ViaShipmentModulePermissions.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('ViaShipmentCreateFAB'),
        onPressed: () => navigate.toViaShipmentForm(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

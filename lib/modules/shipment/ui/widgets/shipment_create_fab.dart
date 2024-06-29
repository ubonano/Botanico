import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/content/setup/navigation.dart';
import '../../../app/ui/ui.dart';
import '../../content/setup/permissions.dart';

class ShipmentCreateFAB extends StatelessWidget with AppNavigationInstance {
  ShipmentCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ShipmentPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('ShipmentCreateFAB'),
        onPressed: () => navigate.toShipmentForm(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

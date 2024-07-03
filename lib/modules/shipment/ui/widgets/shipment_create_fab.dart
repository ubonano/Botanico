import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/ui.dart';
import '../../setup/module.dart';
import '../ui.dart';

class ShipmentCreateFAB extends StatelessWidget {
  const ShipmentCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ShipmentModule>();

    return ProtectedWidget(
      module: module,
      permission: ShipmentKeys.create.id,
      child: FloatingActionButton(
        key: key ?? const Key('ShipmentCreateFAB'),
        onPressed: () => ShipmentFormPage.navigate(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

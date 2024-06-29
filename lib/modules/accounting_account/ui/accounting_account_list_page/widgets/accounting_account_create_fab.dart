import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/content/setup/navigation.dart';

import '../../../../app/ui/ui.dart';
import '../../../content/setup/permissions.dart';

class AccountingAccountCreateFAB extends StatelessWidget with AppNavigationInstance {
  AccountingAccountCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<AccountingAccountPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('AccountingAccountCreateFAB'),
        onPressed: () => navigate.toAccountingAccountForm(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

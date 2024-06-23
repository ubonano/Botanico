import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../company/helpers/navigation_helper.dart';
import '../../../../company/ui/ui.dart';
import '../../../setup/permissions.dart';

class AccountingAccountCreateFAB extends StatelessWidget with NavigationHelperInstance {
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

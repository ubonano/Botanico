import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../content/setup/permissions.dart';
import '../../../ui.dart';

class AccountingAccountCreateFAB extends StatelessWidget {
  const AccountingAccountCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<AccountingAccountPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('AccountingAccountCreateFAB'),
        onPressed: () => AccountingAccountFormPage.navigate(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

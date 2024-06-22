import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../module.dart';

class AccountingAccountCreateFAB extends StatelessWidget with NavigationHelperInstance {
  AccountingAccountCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: AccountingAccountModule(),
      permission: AccountingAccountModule.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('AccountingAccountCreateFAB'),
        onPressed: () => navigate.toAccountingAccountForm(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../module.dart';

class AccountingAccountListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  AccountingAccountListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      key: key ?? const Key('AccountingAccountListPageTileButton'),
      module: AccountingAccountModule(),
      permission: AccountingAccountModule.viewKey,
      child: ListTile(
        leading: const Icon(Icons.account_balance),
        title: const Text('Cuentas Contables'),
        onTap: navigate.toAccountingAccountList,
      ),
    );
  }
}

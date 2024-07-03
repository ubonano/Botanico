import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/module.dart';
import '../../../ui.dart';

class AccountingAccountListPageTileButton extends StatelessWidget {
  const AccountingAccountListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<AccountingAccountModule>();

    return ProtectedWidget(
      key: key ?? const Key('AccountingAccountListPageTileButton'),
      module: module,
      permission: AccountingAccountKeys.view.id,
      child: const ListTile(
        leading: Icon(Icons.account_balance),
        title: Text('Cuentas Contables'),
        onTap: AccountingAccountListPage.navigate,
      ),
    );
  }
}

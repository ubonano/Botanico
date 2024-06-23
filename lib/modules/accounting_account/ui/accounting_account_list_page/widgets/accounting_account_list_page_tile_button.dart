import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../company/helpers/navigation_helper.dart';
import '../../../../company/ui/ui.dart';
import '../../../setup/permissions.dart';

class AccountingAccountListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  AccountingAccountListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<AccountingAccountPermissions>();

    return ProtectedWidget(
      key: key ?? const Key('AccountingAccountListPageTileButton'),
      module: module,
      permission: module.viewKey,
      child: ListTile(
        leading: const Icon(Icons.account_balance),
        title: const Text('Cuentas Contables'),
        onTap: navigate.toAccountingAccountList,
      ),
    );
  }
}

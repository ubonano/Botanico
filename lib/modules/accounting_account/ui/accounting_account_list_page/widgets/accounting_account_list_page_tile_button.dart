import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/navigation.dart';

import '../../../../app/ui/ui.dart';
import '../../../content/setup/permissions.dart';

class AccountingAccountListPageTileButton extends StatelessWidget with AppNavigationInstance {
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

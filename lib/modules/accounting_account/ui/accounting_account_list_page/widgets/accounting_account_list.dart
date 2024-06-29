import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/content/setup/navigation.dart';
import '../../../content/model/accounting_account_model.dart';
import '../../ui.dart';

class AccountingAccountList extends GetView<AccountingAccountListController> with AppNavigationInstance {
  AccountingAccountList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.list$.toList();

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            final AccountingAccountModel accountingAccount = list[index];

            return ListTile(
              title: Text(accountingAccount.name),
              trailing: AccountingAccountListTileTrailingIconButtons(accountingAccount),
              onTap: () => navigate.toAccountingAccountForm(id: accountingAccount.uid, canPop: true),
            );
          },
        );
      },
    );
  }
}

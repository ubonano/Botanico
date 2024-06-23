import 'package:flutter/material.dart';

import '../../../model/accounting_account_model.dart';
import '../../ui.dart';

class AccountingAccountListTileTrailingIconButtons extends StatelessWidget {
  final AccountingAccountModel accountingAccount;

  const AccountingAccountListTileTrailingIconButtons(this.accountingAccount, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AccountingAccountDeleteIconButton(accountingAccount),
      ],
    );
  }
}

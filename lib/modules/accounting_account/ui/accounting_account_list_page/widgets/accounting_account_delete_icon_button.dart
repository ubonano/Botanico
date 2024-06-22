import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../module.dart';

class AccountingAccountDeleteIconButton extends StatelessWidget {
  final AccountingAccountModel accountingAccount;

  const AccountingAccountDeleteIconButton(this.accountingAccount, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: AccountingAccountModule(),
      permission: AccountingAccountModule.deleteKey,
      child: IconButton(
        key: key ?? const Key('AccountingAccountDeleteIconButton'),
        icon: const Icon(Icons.delete),
        onPressed: () => ConfirmationDialog.show(
          context,
          content: '¿Estás seguro de que quieres eliminar esta cuenta contable?',
          onConfirm: () => Get.find<IAccountingAccountService>().delete(accountingAccount),
        ),
      ),
    );
  }
}

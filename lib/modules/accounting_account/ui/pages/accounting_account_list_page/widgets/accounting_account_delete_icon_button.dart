import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/interfaces/i_accounting_account_service.dart';
import '../../../../setup/permissions.dart';

class AccountingAccountDeleteIconButton extends StatelessWidget {
  final AccountingAccountModel accountingAccount;

  const AccountingAccountDeleteIconButton(this.accountingAccount, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<AccountingAccountPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.deleteKey,
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

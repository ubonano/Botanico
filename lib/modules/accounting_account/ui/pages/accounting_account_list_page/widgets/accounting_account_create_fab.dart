import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/module.dart';
import '../../../ui.dart';

class AccountingAccountCreateFAB extends StatelessWidget {
  const AccountingAccountCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<AccountingAccountModule>();

    return ProtectedWidget(
      module: module,
      permission: AccountingAccountKeys.create.id,
      child: FloatingActionButton(
        key: key ?? const Key('AccountingAccountCreateFAB'),
        onPressed: () => AccountingAccountFormPage.navigate(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

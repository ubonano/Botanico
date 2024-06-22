import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../module.dart';

class AccountingAccountListPage extends GetView<AccountingAccountListController> {
  const AccountingAccountListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('AccountingAccountListPage'),
      drawer: CustomDrawer(),
      title: 'Cuentas Contables',
      body: AccountingAccountList(),
      floatingActionButton: AccountingAccountCreateFAB(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../../worker/ui/middlewares.dart';
import '../../../setup/module.dart';
import '../../ui.dart';

class AccountingAccountListPage extends GetView<AccountingAccountListController> {
  const AccountingAccountListPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/accounting-account-list';

  static get page => GetPage(
        name: route,
        page: () => const AccountingAccountListPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
          AccessMiddleware(AccountingAccountModule.moduleId, [AccountingAccountKeys.view.id]),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('AccountingAccountListPage'),
      drawer: const CustomDrawer(),
      title: 'Cuentas Contables',
      body: const AccountingAccountList(),
      floatingActionButton: const AccountingAccountCreateFAB(),
    );
  }
}

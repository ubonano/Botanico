import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../../worker/ui/middlewares.dart';
import '../../ui.dart';

class VendorListPage extends GetView<VendorListController> {
  const VendorListPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/vendor-list';

  static GetPage get page => GetPage(
        name: route,
        page: () => const VendorListPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('VendorListPage'),
      drawer: const CustomDrawer(),
      title: 'Proveedores',
      body: const VendorList(),
      floatingActionButton: const VendorCreateFAB(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/ui/middlewares.dart';
import '../../../worker/ui/middlewares.dart';
import '../ui.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/';

  static GetPage get page => GetPage(
        name: route,
        page: () => const HomePage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    controller.logTag;

    return CustomScaffold(
      key: key ?? const Key('HomePage'),
      title: 'Home',
      drawer: const CustomDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola Mundo', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

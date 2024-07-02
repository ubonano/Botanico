import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui.dart';

class LoadingPage extends GetView<LoadingController> {
  const LoadingPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/loading';

  static GetPage get page => GetPage(name: route, page: () => const LoadingPage());

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoadingController>();
    controller.fetchCurrentWorker();

    return CustomScaffold(
      key: key ?? const Key('LoadingPage'),
      showAppBar: false,
      title: 'Cargando',
      drawer: null,
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

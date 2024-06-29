import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/navigation.dart';
import 'bindings.dart';
import 'content/setup/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      title: 'Botanico',
      initialRoute: AppNavigation.INIT_PAGE,
      getPages: Pages.pages,
    );
  }
}

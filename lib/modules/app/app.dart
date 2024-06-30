import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/home_page/home_page.dart';
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
      initialRoute: HomePage.route,
      getPages: Pages.pages,
    );
  }
}

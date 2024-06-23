import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/company/helpers/navigation_helper.dart';
import 'setup/bindings.dart';
import 'setup/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      title: 'Botanico',
      initialRoute: NavigationHelper.INIT_PAGE,
      getPages: Pages.pages,
    );
  }
}

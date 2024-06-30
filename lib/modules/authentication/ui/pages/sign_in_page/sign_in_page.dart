import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/navigation.dart';
import '../../../../app/ui/ui.dart';
import '../../middlewares.dart';
import '../../ui.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/sign-in';

  static GetPage get page => GetPage(
        name: route,
        page: () => const SignInPage(),
        middlewares: [
          NoAuthMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('SignInPage'),
      showAppBar: false,
      title: 'Iniciar Sesión',
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller),
              PasswordInputField(controller, onFieldSubmitted: controller.secureSubmit),
              const SignInButton(),
              const SignInRecoverButton(),
              const SignUpNavigateButton(),
            ],
          ),
        ),
      ),
    );
  }
}

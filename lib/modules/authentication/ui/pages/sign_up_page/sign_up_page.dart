import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/navigation.dart';
import '../../../../app/ui/widgets/custom_scaffold.dart';
import '../../middlewares.dart';
import '../../ui.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/sign-up';

  static GetPage get page => GetPage(
        name: route,
        page: () => const SignUpPage(),
        middlewares: [
          NoAuthMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('SignUpPage'),
      showAppBar: false,
      title: 'Registro',
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller),
              PasswordInputField(controller),
              ConfirmPasswordInputField(controller, onFieldSubmitted: controller.secureSubmit),
              const SignUpButton(),
              SignInNavigateButton(),
            ],
          ),
        ),
      ),
    );
  }
}

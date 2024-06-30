import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/navigation.dart';
import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../../authentication/ui/ui.dart';
import '../../../../company/ui/ui.dart';
import '../../ui.dart';

class WorkerFormPage extends GetView<WorkerFormController> {
  const WorkerFormPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/worker-form';

  static get page => GetPage(
        name: route,
        page: () => const WorkerFormPage(),
        middlewares: [
          AuthMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('WorkerFormPage'),
      showAppBar: false,
      title: controller.isUpdateMode ? 'Perfil' : 'Crea tu perfil',
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              FullnameInputField(controller),
              BirthdateInputField(controller),
              PhoneInputField(controller),
              DNIInputField(controller),
              const WorkerSaveButton(),
              const SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

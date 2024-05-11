import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class WorkerCreatePage extends GetView<WorkerCreateController> {
  const WorkerCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('WorkerCreatePage'),
      title: 'Completa tu Perfil',
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

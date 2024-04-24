import 'package:botanico/modules/authentication/ui/widgets/sign_out_button.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../worker_module.dart';

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
              const SaveWorkerButton(),
              const SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

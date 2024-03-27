import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerCreatePage extends GetView<WorkerCreateController> {
  const WorkerCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Completa tu Perfil',
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              FullnameInputField(controller: controller.getFieldController('name')!),
              BirthdateInputField(controller: controller.getFieldController('birthDate')!),
              PhoneInputField(controller: controller.getFieldController('phone')!),
              DNIInputField(controller: controller.getFieldController('dni')!),
              CustomButton(text: 'Guardar Perfil', onPressed: controller.secureSubmit)
            ],
          ),
        ),
      ),
    );
  }
}

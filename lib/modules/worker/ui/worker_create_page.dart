import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerCreatePage extends GetView<WorkerCreateController> {
  const WorkerCreatePage({Key? key}) : super(key: key);

  get _title => 'Completa tu Perfil';
  get _createWorkerButtonText => 'Guardar Perfil';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
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
              CustomButton(text: _createWorkerButtonText, onPressed: createWorker)
            ],
          ),
        ),
      ),
    );
  }

  createWorker() {
    if (controller.validateForm()) controller.createWorker();
  }
}

import 'package:botanico/widgets/input_fields/birthdate_input_field.dart';
import 'package:botanico/widgets/input_fields/fullname_input_field.dart';
import 'package:botanico/widgets/input_fields/phone_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/input_fields/dni_input_field.dart';
import 'worker_create_controller.dart';

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
              FullnameInputField(controller: controller.nameController),
              BirthdateInputField(controller: controller.birthDateController),
              PhoneInputField(controller: controller.phoneController),
              DNIInputField(controller: controller.dniController),
              ElevatedButton(onPressed: controller.submit, child: const Text('Guardar Perfil')),
            ],
          ),
        ),
      ),
    );
  }
}

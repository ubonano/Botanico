import 'package:botanico/widgets/buttons/custom_button.dart';
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

  get _formKey => controller.formKey;

  get _title => 'Completa tu Perfil';

  get _nameCtrl => controller.getFieldController('name');
  get _birthDateCtrl => controller.getFieldController('birthDate');
  get _phoneCtrl => controller.getFieldController('phone');
  get _dniCtrl => controller.getFieldController('dni');

  get _createWorkerButtonText => 'Guardar Perfil';

  void _workerCreate() => controller.submit();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FullnameInputField(controller: _nameCtrl),
              BirthdateInputField(controller: _birthDateCtrl),
              PhoneInputField(controller: _phoneCtrl),
              DNIInputField(controller: _dniCtrl),
              CustomButton(text: _createWorkerButtonText, onPressed: _workerCreate)
            ],
          ),
        ),
      ),
    );
  }
}

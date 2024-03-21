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
  get _textCtrls => controller.textCtrls;

  get _fullNameCtrl => _textCtrls[0];
  get _birthDateCtrl => _textCtrls[1];
  get _phoneCtrl => _textCtrls[2];
  get _dniCtrl => _textCtrls[3];

  void _submit() => controller.submit();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Completa tu Perfil',
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FullnameInputField(controller: _fullNameCtrl, onFieldSubmitted: _submit),
              BirthdateInputField(controller: _birthDateCtrl, onFieldSubmitted: _submit),
              PhoneInputField(controller: _phoneCtrl, onFieldSubmitted: _submit),
              DNIInputField(controller: _dniCtrl, onFieldSubmitted: _submit),
              CustomButton(text: 'Guardar Perfil', onPressed: _submit)
            ],
          ),
        ),
      ),
    );
  }
}

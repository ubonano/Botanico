import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../module.dart';

class WorkerSaveButton extends GetView<WorkerFormController> {
  const WorkerSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('WorkerSaveButton'),
      text: 'Guardar Perfil',
      onPressed: controller.secureSubmit,
    );
  }
}

import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerSaveButton extends GetView<WorkerCreateController> {
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

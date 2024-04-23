import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveWorkerButton extends StatelessWidget {
  const SaveWorkerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkerCreateController controller = Get.find();

    return CustomButton(
      key: key ?? const Key('saveWorkerButton'),
      text: 'Guardar Perfil',
      onPressed: controller.secureSubmit,
    );
  }
}

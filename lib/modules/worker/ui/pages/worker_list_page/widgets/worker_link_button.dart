import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../ui.dart';

class WorkerLinkButton extends GetView<WorkerLinkController> {
  const WorkerLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        key: key ?? const Key('WorkerLinkButton'),
        text: 'Vincular Trabajador',
        onPressed: controller.secureSubmit,
        isLoading: controller.isLoading.value,
      ),
    );
  }
}

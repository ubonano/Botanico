import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerLinkButton extends StatelessWidget {
  const WorkerLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    late final WorkerLinkController controller = Get.find();
    return CustomButton(
      key: key ?? const Key('WorkerLinkButton'),
      text: 'Vincular Trabajador',
      onPressed: controller.secureSubmit,
    );
  }
}

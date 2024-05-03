import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WorkerPasteUidButton extends GetView<WorkerLinkController> {
  const WorkerPasteUidButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: key ?? const Key('WorkerPasteUidButton'),
      icon: const Icon(Icons.paste),
      onPressed: pasteWorkerId,
    );
  }

  void pasteWorkerId() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    controller.setFieldValue(FieldKeys.uid, data?.text ?? '');
  }
}

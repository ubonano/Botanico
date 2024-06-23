import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../company/helpers/global_helper.dart';
import '../../../../company/helpers/snackbar_helper.dart';
import '../../../../company/ui/ui.dart';
import '../../ui.dart';

class WorkerCopyUidButton extends GetView<WorkerLobbyController> with GlobalHelper {
  WorkerCopyUidButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      key: key ?? const Key('WorkerCopyUidButton'),
      text: 'Copiar código de vinculación',
      onPressed: copyToClipboard,
    );
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: controller.uid)).then(
      (_) => Get.find<SnackbarHelper>().info('Codigo de vinculación copiado al portapapeles'),
    );
  }
}

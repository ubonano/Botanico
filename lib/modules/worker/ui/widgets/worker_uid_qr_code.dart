import 'package:botanico/modules/worker/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WorkerUidQrCode extends GetView<WorkerLobbyController> {
  const WorkerUidQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => QrImageView(
        data: controller.uid,
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}

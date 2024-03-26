import 'package:botanico/ui/widgets/input_fields/worker_uid_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/widgets/buttons/custom_button.dart';
import '../../../../ui/widgets/custom_scaffold.dart';
import 'link_worker_controller.dart';

class LinkWorkerPage extends GetView<LinkWorkerController> {
  const LinkWorkerPage({Key? key}) : super(key: key);

  get _title => 'Vincular Trabajador';
  get _linkWorkerButtonText => 'Vincular Trabajador';
  get _scanQrCodeButtonText => 'Escanear Código QR';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
      drawer: null,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: WorkerUidInputField(
                        controller: controller.getFieldController('uid')!,
                        onFieldSubmitted: controller.linkWorker,
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.paste), onPressed: controller.pasteWorkerId),
                  ],
                ),
                CustomButton(text: _linkWorkerButtonText, onPressed: controller.linkWorker),
                CustomButton(text: _scanQrCodeButtonText, onPressed: controller.scanQrCode)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

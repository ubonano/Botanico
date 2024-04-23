import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WorkerLinkingPage extends GetView<WorkerLinkingController> {
  const WorkerLinkingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Vincular Trabajador',
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
                        onFieldSubmitted: controller.secureSubmit,
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.paste), onPressed: pasteWorkerId),
                  ],
                ),
                CustomButton(text: 'Vincular Trabajador', onPressed: controller.secureSubmit),
                CustomButton(text: 'Escanear Código QR', onPressed: scanQrCode)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pasteWorkerId() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    controller.setFieldValue('uid', data?.text ?? '');
  }

  Future<void> scanQrCode() async {}
}

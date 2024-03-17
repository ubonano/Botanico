import 'package:botanico/widgets/input_fields/worker_id_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'link_worker_controller.dart';

class LinkWorkerPage extends GetView<LinkWorkerController> {
  const LinkWorkerPage({Key? key}) : super(key: key);

  void submit() => controller.submit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vincular Trabajador'),
      ),
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
                    Expanded(child: WorkerIdInputField(controller: controller.codeCtrl)),
                    IconButton(icon: const Icon(Icons.paste), onPressed: controller.pasteWorkerId),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submit,
                  child: const Text('Vincular Trabajador'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.scanQrCode,
                  child: const Text('Escanear Código QR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

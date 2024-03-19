import 'package:botanico/widgets/input_fields/worker_uid_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_scaffold.dart';
import 'link_worker_controller.dart';

class LinkWorkerPage extends GetView<LinkWorkerController> {
  const LinkWorkerPage({Key? key}) : super(key: key);

  get _formKey => controller.formKey;

  get _workerUidCtrl => controller.textCtrls[0];

  void _submit() => controller.submit();
  void _scanQrCode() => controller.scanQrCode();
  void _pasteWorkerId() => controller.pasteWorkerId();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Vincular Trabajador',
      drawer: null,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(child: WorkerUidInputField(controller: _workerUidCtrl)),
                    IconButton(icon: const Icon(Icons.paste), onPressed: _pasteWorkerId),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: _submit, child: const Text('Vincular Trabajador')),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: _scanQrCode, child: const Text('Escanear Código QR')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'link_worker_controller.dart';

class LinkWorkerPage extends GetView<LinkWorkerController> {
  const LinkWorkerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vincular Trabajador'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.codeCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Código del Trabajador',
                        hintText: 'Ingresa o pega el código aquí',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.paste),
                    onPressed: () async {
                      final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
                      controller.code(data?.text ?? '');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.linkByCode,
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
    );
  }
}

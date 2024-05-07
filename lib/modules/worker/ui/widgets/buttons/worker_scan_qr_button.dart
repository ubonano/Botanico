import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';

class WorkerScanQrButton extends StatelessWidget {
  const WorkerScanQrButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('WorkerScanQrButton'),
      text: 'Escanear Código QR',
      onPressed: scanQrCode,
    );
  }

  Future<void> scanQrCode() async {}
}

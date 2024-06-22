import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

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

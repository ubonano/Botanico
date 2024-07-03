import 'package:flutter/material.dart';

import '../../../../../app/ui/ui.dart';

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

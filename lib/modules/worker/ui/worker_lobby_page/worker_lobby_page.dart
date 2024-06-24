import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/ui.dart';
import '../../../authentication/ui/ui.dart';
import '../../../company/ui/ui.dart';
import '../ui.dart';

class LobbyPage extends GetView<WorkerLobbyController> {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('lobbyPage'),
      title: 'Lobby',
      drawer: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WorkerUidQrCode(),
            const SizedBox(height: 20),
            const Text('Mostrale este código a tu empleador para vincularte a la empresa.'),
            const SizedBox(height: 20),
            WorkerCopyUidButton(),
            CompanyCreateNavigateButton(),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}

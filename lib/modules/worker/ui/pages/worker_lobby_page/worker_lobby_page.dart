import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/navigation.dart';
import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../../authentication/ui/ui.dart';
import '../../../../company/ui/ui.dart';
import '../../middlewares.dart';
import '../../ui.dart';

class LobbyPage extends GetView<WorkerLobbyController> {
  const LobbyPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/lobby';

  static get page => GetPage(
        name: route,
        page: () => const LobbyPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsNotEmployedOrOwnerMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('lobbyPage'),
      showAppBar: false,
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
            const CompanyCreateNavigateButton(),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}

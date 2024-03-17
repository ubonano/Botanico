import 'package:botanico/widgets/sign_out_button/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_drawer_controller.dart';

class CustomDrawer extends GetView<CustomDrawerController> {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Obx(
        () => ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              accountName: Text(controller.workerName, style: const TextStyle(fontSize: 20)),
              accountEmail: Text(controller.workerEmail, style: const TextStyle(fontSize: 14)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  controller.workerName.isNotEmpty ? controller.workerName[0] : 'X',
                  style: TextStyle(fontSize: 40.0, color: Theme.of(context).primaryColor),
                ),
              ),
              otherAccountsPictures: const [
                SignOutIconButton(),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: Text(controller.companyName),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: controller.navigateToHome,
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Trabajadores'),
              onTap: controller.navigateToLinkedWorkers,
            ),
          ],
        ),
      ),
    );
  }
}

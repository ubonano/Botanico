import 'package:botanico/modules/authentication/ui/widgets/sign_out_button.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends GetView<CustomDrawerController> with NavigationHelperInstance {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Obx(
        () => ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              accountName: Text(controller.currentWorker$?.name ?? '', style: const TextStyle(fontSize: 20)),
              accountEmail: Text(controller.currentWorker$?.email ?? '', style: const TextStyle(fontSize: 14)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  controller.currentWorker$ != null && controller.currentWorker$!.name.isNotEmpty
                      ? controller.currentWorker$!.name[0]
                      : 'X',
                  style: TextStyle(fontSize: 40.0, color: Theme.of(context).primaryColor),
                ),
              ),
              otherAccountsPictures: const [
                SignOutIconButton(),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: Text(controller.currentCompany$?.name ?? ''),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: navigate.toHome,
            ),
            PermissionProtected(
              permission: WorkerModulePermissions.viewKey,
              child: ListTile(
                leading: const Icon(Icons.work),
                title: const Text('Trabajadores'),
                onTap: navigate.toWorkerList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

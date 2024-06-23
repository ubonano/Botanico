import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../accounting_account/ui/ui.dart';
import '../../../authentication/ui/ui.dart';
import '../../../vendor/ui/ui.dart';
import '../../../via_shipment/ui/ui.dart';
import '../../../worker/ui/ui.dart';
import '../../setup/navigation.dart';
import '../../../company/ui/ui.dart';
import '../ui.dart';

class CustomDrawer extends GetView<CustomDrawerController> with NavigationHelperInstance {
  CustomDrawer({super.key});

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
              otherAccountsPictures: const [SignOutIconButton()],
            ),
            CompanyFormPageTileButton(),
            HomePageTileButton(),
            WorkerListPageTileButton(),
            VendorListPageTileButton(),
            AccountingAccountListPageTileButton(),
            ViaShipmentListPageTileButton(),
          ],
        ),
      ),
    );
  }
}

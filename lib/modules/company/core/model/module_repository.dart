import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import 'package:botanico/modules/via_shipment/module.dart';

import '../../../accounting_account/setup/permissions.dart';
import '../../../vendor/setup/permissions.dart';

class ModuleRepository {
  final modules$ = [
    CompanyModule(),
    WorkerModule(),
    Get.find<VendorPermissions>(),
    Get.find<AccountingAccountPermissions>(),
    ViaShipmentModule(),
  ].obs;
}

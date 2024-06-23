import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../accounting_account/setup/permissions.dart';
import '../../../vendor/setup/permissions.dart';
import '../../../via_shipment/setup/permissions.dart';
import '../../../worker/setup/permissions.dart';

class ModuleRepository {
  final modules$ = [
    CompanyModule(),
    Get.find<WorkerPermissions>(),
    Get.find<VendorPermissions>(),
    Get.find<AccountingAccountPermissions>(),
    Get.find<ViaShipmentPermissions>(),
  ].obs;
}

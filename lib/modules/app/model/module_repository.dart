import 'package:get/get.dart';

import '../../accounting_account/setup/permissions.dart';
import '../../vendor/setup/permissions.dart';
import '../../via_shipment/setup/permissions.dart';
import '../../worker/setup/permissions.dart';
import '../../company/setup/permissions.dart';

class ModuleRepository {
  final modules$ = [
    Get.find<CompanyPermissions>(),
    Get.find<WorkerPermissions>(),
    Get.find<VendorPermissions>(),
    Get.find<AccountingAccountPermissions>(),
    Get.find<ViaShipmentPermissions>(),
  ].obs;
}

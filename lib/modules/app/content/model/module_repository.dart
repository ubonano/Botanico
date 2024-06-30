import 'package:get/get.dart';

import '../../../accounting_account/setup/permissions.dart';
import '../../../vendor/content/setup/permissions.dart';
import '../../../shipment/setup/permissions.dart';
import '../../../worker/content/setup/permissions.dart';
import '../../../company/setup/permissions.dart';

class ModuleRepository {
  final modules$ = [
    Get.find<CompanyPermissions>(),
    Get.find<WorkerPermissions>(),
    Get.find<VendorPermissions>(),
    Get.find<AccountingAccountPermissions>(),
    Get.find<ShipmentPermissions>(),
  ].obs;
}

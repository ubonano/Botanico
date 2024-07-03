import 'package:get/get.dart';

import '../../../accounting_account/setup/module.dart';
import '../../../vendor/setup/module.dart';
import '../../../shipment/setup/module.dart';
import '../../../worker/content/setup/module.dart';
import '../../../company/setup/module.dart';

class ModuleRepository {
  final modules$ = [
    Get.find<CompanyModule>(),
    Get.find<WorkerModule>(),
    Get.find<VendorModule>(),
    Get.find<AccountingAccountModule>(),
    Get.find<ShipmentModule>(),
  ].obs;
}

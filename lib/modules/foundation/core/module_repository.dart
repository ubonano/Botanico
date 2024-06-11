import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/modules/vendor/module.dart';
import 'package:botanico/modules/accounting_account/module.dart';
import 'package:botanico/modules/via_shipment/module.dart';

class ModuleRepository {
  final modules$ = [
    CompanyModulePermissions().toModel(),
    WorkerModulePermissions().toModel(),
    VendorModulePermissions().toModel(),
    AccountingAccountModulePermissions().toModel(),
    ViaShipmentModulePermissions().toModel(),
  ].obs;
}

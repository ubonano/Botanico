// ignore_for_file: library_prefixes

import '../../../accounting_account/setup/module.dart';
import '../../../authentication/setup/module.dart';
import '../../../company/setup/module.dart';
import '../../../shipment/setup/module.dart';
import '../../../vendor/setup/module.dart';
import '../../../worker/content/setup/module.dart';
import 'module.dart';

class Pages {
  static final pages = [
    ...ApplicationModule.pages,
    ...CompanyModule.pages,
    ...AuthenticationModule.pages,
    ...WorkerModule.pages,
    ...VendorModule.pages,
    ...AccountingAccountModule.pages,
    ...ShipmentModule.pages,
  ];
}

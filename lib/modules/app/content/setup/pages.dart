// ignore_for_file: library_prefixes

import 'package:botanico/modules/accounting_account/content/setup/navigation.dart' as AccountingAccount;
import 'package:botanico/modules/authentication/content/setup/navigation.dart' as Authentication;
import 'package:botanico/modules/vendor/content/setup/navigation.dart' as Vendor;
import 'package:botanico/modules/shipment/content/setup/navigation.dart' as ViaShipment;
import 'package:botanico/modules/worker/content/setup/navigation.dart' as Worker;
import 'package:botanico/modules/company/content/setup/navigation.dart' as Company;

class Pages {
  static final pages = [
    ...Company.pages,
    ...Authentication.pages,
    ...Worker.pages,
    ...Vendor.pages,
    ...AccountingAccount.pages,
    ...ViaShipment.pages,
  ];
}

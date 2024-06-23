// ignore_for_file: library_prefixes

import 'package:botanico/modules/accounting_account/lib/setup/navigation.dart' as AccountingAccount;
import 'package:botanico/modules/authentication/setup/navigation.dart' as Authentication;
import 'package:botanico/modules/vendor/setup/navigation.dart' as Vendor;
import 'package:botanico/modules/via_shipment/setup/navigation.dart' as ViaShipment;
import 'package:botanico/modules/worker/setup/navigation.dart' as Worker;
import 'package:botanico/modules/company/setup/navigation.dart' as Company;

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

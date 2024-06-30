// ignore_for_file: library_prefixes

import 'package:botanico/modules/app/ui/ui.dart' as App;
import 'package:botanico/modules/accounting_account/ui/ui.dart' as AccountingAccount;
import 'package:botanico/modules/authentication/ui/ui.dart' as Authentication;
import 'package:botanico/modules/vendor/ui/ui.dart' as Vendor;
import 'package:botanico/modules/shipment/ui/ui.dart' as Shipment;
import 'package:botanico/modules/worker/ui/ui.dart' as Worker;
import 'package:botanico/modules/company/ui/ui.dart' as Company;

class Pages {
  static final pages = [
    ...App.pages,
    ...Company.pages,
    ...Authentication.pages,
    ...Worker.pages,
    ...Vendor.pages,
    ...AccountingAccount.pages,
    ...Shipment.pages,
  ];
}

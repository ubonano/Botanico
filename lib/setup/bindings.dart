import 'package:botanico/modules/authentication/authentication_module.dart' as auth;
import 'package:botanico/modules/company/company_module.dart' as company;
import 'package:botanico/modules/foundation/foundation_module.dart' as foundation;
import 'package:botanico/modules/worker/worker_module.dart' as worker;
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    auth.dependencies();
    worker.dependencies();
    company.dependencies();
    foundation.dependencies();
  }
}

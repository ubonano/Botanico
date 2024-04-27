import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class PostSignOutService extends GetxService with GlobalServices, WorkerContext, CompanyContext {
  Future<void> handlePostSignOut() async {
    cleanCurrentWorker();
    cleanCurrentCompany();

    navigate.toSignIn();
  }
}

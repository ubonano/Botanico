import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class PostSignOutService extends GetxService with GlobalServices {
  late final WorkerRepository _workerRepo = Get.find();
  late final CompanyRepository _companyRepo = Get.find();

  Future<void> handlePostSignOut() async {
    _workerRepo.clearCurrentWorker();
    _companyRepo.clearCurrentCompany();

    navigate.toSignIn();
  }
}

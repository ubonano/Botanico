import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class PostSignOutService extends GetxService {
  late final WorkerRepository _workerRepo = Get.find();
  late final CompanyRepository _companyRepo = Get.find();
  late final NavigationService _navigate = Get.find();

  Future<void> handlePostSignOut() async {
    _workerRepo.clearCurrentWorker();
    _companyRepo.clearCurrentCompany();

    _navigate.toSignIn();
  }
}

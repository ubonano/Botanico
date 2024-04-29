import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController with LifeCycleLogging {
  @override
  String get logTag => 'CustomDrawerController';

  late final AuthenticationRepository authRepo = Get.find();
  late final WorkerRepository _workerRepo = Get.find();
  late final CompanyRepository _companyRepo = Get.find();

  WorkerModel? get currentWorker$ => _workerRepo.currentWorker$;
  CompanyModel? get currentCompany$ => _companyRepo.currentCompany$;

  @override
  Future<void> onInit() async {
    super.onInit();

    // await _workerRepo.fetch(authRepo.user!.uid);
    // await _companyRepo.get(_workerRepo.currentWorker$!.companyId);
  }
}

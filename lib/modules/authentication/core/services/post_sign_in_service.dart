import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class PostSignInService extends GetxService with GlobalServices, AuthContext {
  late final WorkerRepository _workerRepo = Get.find();
  late final CompanyRepository _companyRepo = Get.find();

  Future<void> handlePostSignIn() async {
    await fetchCompany(await getWorker());

    if (isWorkerLinkedToCompany()) navigate.toHome();
    if (isWorkerNotLinkedToCompany()) navigate.toLobby();
    if (isUserWithoutWorker()) navigate.toWorkerCreate();
  }

  Future<WorkerModel?> getWorker() async => await _workerRepo.fetch(authRepo.user!.uid);

  Future<void> fetchCompany(WorkerModel? worker) async {
    if (worker != null && worker.companyId.isNotEmpty) await _companyRepo.fetch(worker.companyId);
  }

  bool isWorkerLinkedToCompany() => _workerRepo.currentWorker$ != null && _companyRepo.currentCompany$ != null;
  bool isWorkerNotLinkedToCompany() => _workerRepo.currentWorker$ != null && _companyRepo.currentCompany$ == null;
  bool isUserWithoutWorker() => _workerRepo.currentWorker$ == null;
}

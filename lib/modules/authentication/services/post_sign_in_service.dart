import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class PostSignInService extends GetxService {
  late final AuthRepository _authRepo = Get.find();
  late final WorkerRepository _workerRepo = Get.find();
  late final CompanyRepository _companyRepo = Get.find();
  late final NavigationService _navigate = Get.find();

  Future<void> handlePostSignIn() async {
    await fetchCompany(await getWorker());

    if (isWorkerLinkedToCompany()) _navigate.toHome();
    if (isWorkerNotLinkedToCompany()) _navigate.toLobby();
    if (isUserWithoutWorker()) _navigate.toWorkerCreate();
  }

  Future<WorkerModel?> getWorker() async => await _workerRepo.fetch(_authRepo.user!.uid);

  Future<void> fetchCompany(WorkerModel? worker) async {
    if (worker != null && worker.companyId.isNotEmpty) await _companyRepo.fetch(worker.companyId);
  }

  bool isWorkerLinkedToCompany() => _workerRepo.currentWorker$ != null && _companyRepo.currentCompany$ != null;
  bool isWorkerNotLinkedToCompany() => _workerRepo.currentWorker$ != null && _companyRepo.currentCompany$ == null;
  bool isUserWithoutWorker() => _workerRepo.currentWorker$ == null;
}

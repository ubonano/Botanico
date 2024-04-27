import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class PostSignInService extends GetxService with GlobalServices, AuthContext, WorkerContext, CompanyContext {
  Future<void> handlePostSignIn() async {
    await getCompany(await getWorker(authRepo.user!.uid));

    if (isWorkerLinkedToCompany()) navigate.toHome();
    if (isWorkerNotLinkedToCompany()) navigate.toLobby();
    if (isUserWithoutWorker()) navigate.toWorkerCreate();
  }

  bool isWorkerLinkedToCompany() => workerRepo.currentWorker$ != null && companyRepo.currentCompany$ != null;
  bool isWorkerNotLinkedToCompany() => workerRepo.currentWorker$ != null && companyRepo.currentCompany$ == null;
  bool isUserWithoutWorker() => workerRepo.currentWorker$ == null;
}

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';

class AuthenticationHandler with GlobalServices, AuthenticationContext, WorkerContext, CompanyContext {
  void postSignUp() async => navigate.toWorkerCreate();
  void postRecoverPassword() async => navigate.back();

  Future<void> postSignIn() async {
    WorkerModel? worker = await workerRepo.fetch(authRepo.user!.uid);

    if (worker == null) {
      navigate.toWorkerCreate();
      return;
    }

    CompanyModel? company = await companyRepo.fetch(worker.companyId);
    if (company != null) {
      navigate.toHome();
    } else {
      navigate.toLobby();
    }
  }

  void postSignOut() async {
    workerRepo.clearCurrentWorker();
    companyRepo.clearCurrentCompany();

    navigate.toSignIn();
  }
}

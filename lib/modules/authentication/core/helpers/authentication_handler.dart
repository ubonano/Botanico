import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationHandler with GlobalServices, AuthenticationContext, WorkerContext, CompanyContext {
  Future<User?> signUp(String email, String password) async => await authRepo.signUp(email, password);

  void postSignUp() async => navigate.toWorkerCreate();

  Future<void> signIn(String email, String password) async => await authRepo.signIn(email, password);

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

  Future<void> signOut() async => await authRepo.signOut();

  void postSignOut() async {
    workerRepo.clearCurrentWorker();
    companyRepo.clearCurrentCompany();

    navigate.toSignIn();
  }

  Future<void> recoverPassword(String email) async => await authRepo.recoverPassword(email);
  void postRecoverPassword() async => navigate.back();
}

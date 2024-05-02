import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../authentication_module.dart';

class AuthenticationHandler with GlobalServices {
  late final AuthenticationRepository _authRepo = Get.find();

  late final CompanyHandler _companyHandler = Get.find();
  late final WorkerHandler _workerHandler = Get.find();

  User? get currentUser => _authRepo.currentUser;
  bool get isLoggedInUser => _authRepo.currentUser != null;

  Future<User?> signUp(String email, String password) async => await _authRepo.signUp(email, password);
  void postSignUp() async => navigate.toWorkerCreate();

  Future<void> signIn(String email, String password) async => await _authRepo.signIn(email, password);
  Future<void> postSignIn() async {
    WorkerModel? worker = await _workerHandler.fetchLoggedWorker();

    if (worker == null) {
      navigate.toWorkerCreate();
      return;
    }

    CompanyModel? company = await _companyHandler.fetch(worker.companyId);
    if (company != null) {
      navigate.toHome();
    } else {
      navigate.toLobby();
    }
  }

  Future<void> signOut() async => await _authRepo.signOut();
  void postSignOut() async {
    _workerHandler.clearCurrentWorker();
    _companyHandler.clearCurrentCompany();

    navigate.toSignIn();
  }

  Future<void> recoverPassword(String email) async => await _authRepo.recoverPassword(email);
  void postRecoverPassword() async => navigate.back();
}

import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

import '../../authentication_module.dart';

class AuthenticationBusinessLogic extends GetxService with GlobalServices implements IAuthenticationBusinessLogic {
  late final AuthenticationRepository _authRepo = Get.find();

  late final CompanyHandler _companyHandler = Get.find();
  late final WorkerHandler _workerHandler = Get.find();

  @override
  User? get currentUser => _authRepo.currentUser;

  @override
  Future<User?> signUp(String email, String password) async => await _authRepo.signUp(email, password);

  @override
  void postSignUp() async => navigate.toWorkerCreate();

  @override
  Future<void> signIn(String email, String password) async => await _authRepo.signIn(email, password);

  @override
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

  @override
  Future<void> signOut() async => await _authRepo.signOut();

  @override
  void postSignOut() async {
    _workerHandler.clearCurrentWorker();
    _companyHandler.clearCurrentCompany();

    navigate.toSignIn();
  }

  @override
  Future<void> recoverPassword(String email) async => await _authRepo.recoverPassword(email);

  @override
  void postRecoverPassword() async => navigate.back();
}

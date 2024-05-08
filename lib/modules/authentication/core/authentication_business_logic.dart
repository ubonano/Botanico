import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

import '../module.dart';

class AuthenticationBusinessLogic extends GetxService with GlobalHelper implements IAuthenticationBusinessLogic {
  late final IAuthenticationRepository _authRepo = Get.find();

  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();
  late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();

  @override
  User? get currentUser => _authRepo.currentUser;

  @override
  String get currentUserId => currentUser != null ? currentUser!.uid : '';

  @override
  String get currentUserEmail => currentUser != null ? currentUser!.email! : '';

  @override
  Future<User?> signUp(String email, String password) async => await _authRepo.signUp(email, password);

  @override
  void postSignUp() async => navigate.toWorkerCreate();

  @override
  Future<void> signIn(String email, String password) async => await _authRepo.signIn(email, password);

  @override
  Future<void> postSignIn() async {
    WorkerModel? worker = await _workerBusinessLogic.fetchLoggedWorker();

    if (worker == null) {
      navigate.toWorkerCreate();
      return;
    }

    CompanyModel? company = await _companyBusinessLogic.fetch(worker.companyId);
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
    _workerBusinessLogic.clearCurrentWorker();
    _companyBusinessLogic.clearCurrentCompany();

    navigate.toSignIn();
  }

  @override
  Future<void> recoverPassword(String email) async => await _authRepo.recoverPassword(email);

  @override
  void postRecoverPassword() async => navigate.back();
}

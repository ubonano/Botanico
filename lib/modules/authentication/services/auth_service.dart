import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class AuthService extends GetxService {
  late final OperationManagerService _operationManager = Get.find();
  late final AuthRepository _authRepository = Get.find();
  late final WorkerService _workerService = Get.find();
  late final CompanyService _companyService = Get.find();

  final Rx<WorkerModel?> _worker = Rx<WorkerModel?>(null);
  final Rx<CompanyModel?> _company = Rx<CompanyModel?>(null);

  WorkerModel? get worker => _worker.value;
  CompanyModel? get company => _company.value;
  User? get user => _authRepository.user;

  bool get isLoggedInUser => _authRepository.user != null;

  bool get workerIsLoaded => _worker.value != null;
  bool get workerHasCompany => workerIsLoaded && worker!.companyId != '';

  bool get companyIsLoaded => _company.value != null;

  Future<void> signIn({
    required String email,
    required String password,
    required Function() onWorkerLinkedToCompany,
    required Function() onWorkerNotLinkedToCompany,
    required Function() onUserWithoutWorker,
  }) async {
    await _operationManager.perform(
      operationName: 'Sign in',
      operation: (_) async => await _authRepository.signIn(email, password),
      onSuccess: () async {
        await fetchWorker();
        if (workerIsLoaded && companyIsLoaded) onWorkerLinkedToCompany();
        if (workerIsLoaded && !companyIsLoaded) onWorkerNotLinkedToCompany();
        if (!workerIsLoaded) onUserWithoutWorker();
      },
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required Function() onSuccess,
  }) async {
    await _operationManager.perform(
      operationName: 'Sign up',
      operation: (_) async => await _authRepository.signUp(email, password),
      onSuccess: () async {
        await fetchWorker();
        onSuccess();
      },
    );
  }

  Future<void> passwordRecover({required String email, required Function() onSuccess}) async {
    await _operationManager.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) async => await _authRepository.recoverPassword(email),
      onSuccess: onSuccess,
    );
  }

  Future<void> signOut({required Function() onSuccess}) async {
    await _operationManager.perform(
      operationName: 'Sign out',
      operation: (_) async => await _authRepository.signOut(),
      onSuccess: onSuccess,
    );
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    _authRepository.userChanges.listen(
      (user) {
        if (user != null) {
          _fetchWorker(user.uid);
        } else {
          _clearSession();
        }
      },
    );
  }

  Future<void> fetchWorker() async => await _fetchWorker(user?.uid ?? '');

  Future<void> _fetchWorker(String userId) async {
    final worker = await _workerService.getWorker(userId);
    _worker.value = worker;
    if (worker != null && worker.companyId.isNotEmpty) {
      await _fetchCompany(worker.companyId);
    } else {
      _company.value = null;
    }
  }

  Future<void> _fetchCompany(String companyId) async => _company.value = await _companyService.get(companyId);

  void _clearSession() {
    _worker.value = null;
    _company.value = null;
  }
}

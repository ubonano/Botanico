import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import 'package:get/get.dart';

class SessionService extends GetxService {
  late final AuthRepository _authService = Get.find();
  late final WorkerService _workerService = Get.find();
  late final CompanyService _companyService = Get.find();

  final Rx<WorkerModel?> _worker = Rx<WorkerModel?>(null);
  final Rx<CompanyModel?> _company = Rx<CompanyModel?>(null);

  WorkerModel? get worker => _worker.value;
  CompanyModel? get company => _company.value;

  bool get isLoggedInUser => _authService.user != null;
  String get userUID => _authService.user?.uid ?? '';
  String get userEmail => _authService.user?.email ?? '';

  bool get workerIsLoaded => _worker.value != null;
  bool get workerHasCompany => workerIsLoaded && worker!.companyId != '';

  bool get companyIsLoaded => _company.value != null;
  String get companyId => _company.value?.uid ?? '';

  Future<void> signIn(String email, String password) async {
    await _authService.signIn(email, password);
    await fetchWorker();
  }

  Future<void> signUp(String email, String password) async {
    await _authService.signUp(email, password);
    await fetchWorker();
  }

  Future<void> recoverPassword(String email) async => await _authService.recoverPassword(email);
  Future<void> signOut() async => await _authService.signOut();

  @override
  Future<void> onInit() async {
    super.onInit();

    _authService.userChanges.listen(
      (user) {
        if (user != null) {
          _fetchWorker(user.uid);
        } else {
          _clearSession();
        }
      },
    );
  }

  Future<void> fetchWorker() async => await _fetchWorker(userUID);

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

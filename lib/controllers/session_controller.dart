import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/company_model.dart';
import '../models/worker_model.dart';
import '../services/auth_service.dart';
import '../services/company_service.dart';
import '../services/worker_service.dart';
import '../utils/life_cycle_log_controller.dart';

class SessionController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'SessionController';

  late final AuthService _authService = Get.find();
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

  Future<User?> signIn(String email, String password) async => await _authService.signIn(email, password);
  Future<User?> signUp(String email, String password) async => await _authService.signUp(email, password);
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
    final worker = await _workerService.get(userId);
    _worker.value = worker;
    if (worker != null && worker.companyId.isNotEmpty) {
      await _fetchCompany(worker.companyId);
    } else {
      _company.value = null;
    }
  }

  Future<void> _fetchCompany(String companyId) async {
    final company = await _companyService.get(companyId);
    _company.value = company;
  }

  void _clearSession() {
    _worker.value = null;
    _company.value = null;
  }
}

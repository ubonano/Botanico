import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/company_model.dart';
import '../models/worker_model.dart';
import '../services/auth_service.dart';
import '../services/company_service.dart';
import '../services/worker_service.dart';
import '../utils/custom_controller.dart';

class SessionController extends GetxController with CustomController {
  @override
  String get logTag => 'SessionController';

  late final AuthService _authService = Get.find();
  late final WorkerService _workerService = Get.find();
  late final CompanyService _companyService = Get.find();

  final Rx<WorkerModel?> _currentWorker = Rx<WorkerModel?>(null);
  final Rx<CompanyModel?> _currentCompany = Rx<CompanyModel?>(null);

  WorkerModel? get currentWorker => _currentWorker.value;
  CompanyModel? get currentCompany => _currentCompany.value;

  bool get isLoggedInUser => _authService.user != null;
  String get currentUserUID => _authService.user?.uid ?? '';
  String get currentUserEmail => _authService.user?.email ?? '';

  bool get currentWorkerIsLoaded => _currentWorker.value != null;
  bool get currentWorkerHasCompany => currentWorkerIsLoaded && currentWorker!.companyId != '';
  String get currentCompanyId => _currentCompany.value?.uid ?? '';
  bool get currentCompanyIsLoaded => _currentCompany.value != null;

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

  Future<void> fetchWorker() async => await _fetchWorker(currentUserUID);

  Future<void> _fetchWorker(String userId) async {
    final worker = await _workerService.fetch(userId);
    _currentWorker.value = worker;
    if (worker != null && worker.companyId.isNotEmpty) {
      await _fetchCompany(worker.companyId);
    } else {
      _currentCompany.value = null;
    }
  }

  Future<void> _fetchCompany(String companyId) async {
    final company = await _companyService.fetch(companyId);
    _currentCompany.value = company;
  }

  void _clearSession() {
    _currentWorker.value = null;
    _currentCompany.value = null;
  }
}

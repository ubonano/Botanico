import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../foundation/services/common_services.dart';
import '../foundation/utils/log_lifecycle.dart';

class AuthService extends GetxService with CommonServices, LogLifecycleService {
  @override
  String get logTag => 'AuthService';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rx<User?> _firebaseUser = Rx<User?>(null);

  User? get currentUser => _auth.currentUser;
  bool get isUserLoggedIn => currentUser != null;

  @override
  void onInit() {
    super.onInit();

    _firebaseUser.bindStream(_auth.authStateChanges());
    _firebaseUser.listen(_handleAuthStateChanged);
  }

  void _handleAuthStateChanged(User? user) async {
    // TODO
    if (isUserLoggedIn) {
      await userProfileService.fetchUserProfile(user!.uid);

      if (userProfileService.isUserProfile) {
        navigationService.toHome();
      } else {
        navigationService.toUserProfile();
      }
    } else {
      userProfileService.cleanUserProfile();
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<void> signOut() async => await _auth.signOut();

  Future<void> recoverPassword(String email) async => await _auth.sendPasswordResetEmail(email: email);
}

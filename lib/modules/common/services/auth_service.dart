import 'dart:async';
import 'package:botanico/modules/common/utils/common_services.dart';
import 'package:botanico/modules/common/utils/log_lifecycle_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../config/firestore_collections.dart';
import '../../user_profile/user_profile_model.dart';

class AuthService extends GetxService with CommonServices, LogLifecycleService {
  @override
  String get logTag => 'AuthService';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userProfilesCollectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.userProfiles);

  final Rx<User?> _firebaseUser = Rx<User?>(null);
  final Rx<UserProfileModel?> userProfileObx = Rx<UserProfileModel?>(null);

  User? get currentUser => _firebaseUser.value;
  bool get isUserLoggedIn => _auth.currentUser != null;

  UserProfileModel? get userProfile => userProfileObx.value;
  bool get isUserProfile => userProfile != null;

  StreamSubscription<User?>? _authSubscription;

  AuthService() {
    _firebaseUser.bindStream(_auth.authStateChanges());

    _authSubscription?.cancel();
    _authSubscription = _firebaseUser.listen(
      (user) async {
        if (user != null) {
          await fetchUserProfile();

          _navigate();
        } else {
          userProfileObx.value = null;
        }
      },
    );
  }

  void _navigate() {
    if (isUserProfile && currentUser != null) {
      if (userProfile!.companyUid.isNotEmpty) {
        navigationService.navigateToHome();
      } else {
        navigationService.navigateToLobby();
      }
    } else {
      navigationService.navigateToUserProfile();
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    return asyncOperationService.performAsyncAuthOperation(
      () => _auth.signInWithEmailAndPassword(email: email, password: password),
      operationName: 'Sign in',
    );
  }

  Future<UserCredential?> createUserWithEmailAndPassword(String email, String password) async {
    return asyncOperationService.performAsyncAuthOperation(
      () => _auth.createUserWithEmailAndPassword(email: email, password: password),
      operationName: 'Sign up',
    );
  }

  Future<void> signOut() async {
    await asyncOperationService.performAsyncAuthOperation(() => _auth.signOut(), operationName: 'Sign out');
  }

  Future<void> recoverPassword(String email) async {
    await asyncOperationService.performAsyncOperation<void>(
      () => _auth.sendPasswordResetEmail(email: email),
      successMessage:
          'Se ha enviado un correo para restablecer tu contraseña. Por favor, revisa tu bandeja de entrada.',
      errorMessage:
          'Error al intentar restablecer la contraseña. Por favor, verifica que el correo electrónico sea correcto.',
      operationName: 'Recuperación de contraseña',
    );
  }

  Future<void> fetchUserProfile() async {
    if (currentUser != null && userProfileObx.value == null) {
      userProfileObx.value = await asyncOperationService.performAsyncOperation<UserProfileModel?>(
        () async => await _getUserProfile(currentUser!.uid),
        errorMessage: 'Error al cargar el perfil de usuario',
        operationName: "Cargar perfil de usuario UID=${currentUser!.uid}",
      );
    }
  }

  Future<void> setUserProfile(UserProfileModel userProfile) async {
    await asyncOperationService.performAsyncOperation<void>(
      () async {
        await _setUserProfile(userProfile);
        userProfileObx.value = userProfile;
      },
      successMessage: 'Perfil de usuario actualizado con éxito',
      errorMessage: 'Error al actualizar el perfil de usuario',
      operationName: "Actualizar perfil de usuario UID=${userProfile.uid}",
    );
  }

  Future<void> updateUserProfileWithCompanyUid(String userUid, String companyUid) async {
    await asyncOperationService.performAsyncOperation<void>(
      () async {
        await _userProfilesCollectionRef.doc(userUid).update({'companyUid': companyUid});
      },
      errorMessage: 'Error al actualizar el perfil del usuario con el ID de la compañía',
      operationName: "Actualizar perfil de usuario con ID de la compañía",
    );
  }

  Future<UserProfileModel?> _getUserProfile(String uid) async {
    final docSnapshot = await _userProfilesCollectionRef.doc(uid).get();
    return _toUserProfileModel(docSnapshot);
  }

  Future<void> _setUserProfile(UserProfileModel user) async {
    await _userProfilesCollectionRef.doc(user.uid).set(user.toMap());
  }

  UserProfileModel? _toUserProfileModel(DocumentSnapshot doc) {
    if (doc.exists) {
      return UserProfileModel.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  @override
  void onClose() {
    _authSubscription?.cancel();

    super.onClose();
  }
}

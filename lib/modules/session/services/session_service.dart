import 'dart:async';

import 'package:botanico/modules/foundation/services/async_operation_service.dart';
import 'package:botanico/modules/foundation/services/navigation_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../foundation/config/firestore_collections.dart';
import '../models/user_profile_model.dart';

class SessionService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userProfilesCollectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.userProfiles);

  final NavigationService _navigationService = Get.find();
  final AsyncOperationService _asyncOperationService = Get.find();

  final Rx<User?> _firebaseUser = Rx<User?>(null);
  final Rx<UserProfileModel?> userProfileObx = Rx<UserProfileModel?>(null);

  User? get currentUser => _firebaseUser.value;
  UserProfileModel? get userProfile => userProfileObx.value;

  bool get isUserLoggedIn => _auth.currentUser != null;

  StreamSubscription<User?>? _authSubscription;

  SessionService() {
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
    if (userProfile != null) {
      _navigationService.navigateToHome();
    } else {
      _navigationService.navigateToUserProfile();
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    return _asyncOperationService.performAsyncAuthOperation(
      () => _auth.signInWithEmailAndPassword(email: email, password: password),
      operationName: 'Sign in',
    );
  }

  Future<UserCredential?> createUserWithEmailAndPassword(String email, String password) async {
    return _asyncOperationService.performAsyncAuthOperation(
      () => _auth.createUserWithEmailAndPassword(email: email, password: password),
      operationName: 'Sign up',
    );
  }

  Future<void> signOut() async {
    await _asyncOperationService.performAsyncAuthOperation(() => _auth.signOut(), operationName: 'Sign out');
  }

  Future<void> fetchUserProfile() async {
    if (currentUser != null && userProfileObx.value == null) {
      userProfileObx.value = await _asyncOperationService.performAsyncOperation<UserProfileModel?>(
        () async => await _getUserProfile(currentUser!.uid),
        errorMessage: 'Error al cargar el perfil de usuario',
        operationName: "Cargar perfil de usuario UID=${currentUser!.uid}",
      );
    }
  }

  Future<void> setUserProfile(UserProfileModel userProfile) async {
    await _asyncOperationService.performAsyncOperation<void>(
      () async {
        await _setUserProfile(userProfile);
        userProfileObx.value = userProfile;
      },
      successMessage: 'Perfil de usuario actualizado con éxito',
      errorMessage: 'Error al actualizar el perfil de usuario',
      operationName: "Actualizar perfil de usuario UID=${userProfile.uid}",
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

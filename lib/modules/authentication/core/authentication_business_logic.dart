import 'package:get/get.dart';

import '../module.dart';

class AuthenticationBusinessLogic extends GetxService implements IAuthenticationBusinessLogic {
  late final IAuthenticationRepository _authRepo = Get.find();

  @override
  User? get currentUser => _authRepo.currentUser;

  @override
  Future<User?> signUp(String email, String password) async => await _authRepo.signUp(email, password);

  @override
  Future<User?> signIn(String email, String password) async => await _authRepo.signIn(email, password);

  @override
  Future<void> signOut() async => await _authRepo.signOut();

  @override
  Future<void> recoverPassword(String email) async => await _authRepo.recoverPassword(email);
}

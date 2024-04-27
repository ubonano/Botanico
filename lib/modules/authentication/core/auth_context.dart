import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

mixin AuthContext {
  late final OperationManagerService oprManager = Get.find();
  late final AuthRepository authRepo = Get.find();

  Future<void> signUp({required String email, required String password, required dynamic Function() onSuccess}) async {
    await oprManager.perform(
      operationName: 'Sign up',
      operation: (_) async => await authRepo.signUp(email, password),
      onSuccess: onSuccess,
    );
  }

  Future<void> signIn({required String email, required String password, required dynamic Function() onSuccess}) async {
    await oprManager.perform(
      operationName: 'Sign in',
      operation: (_) async => await authRepo.signIn(email, password),
      onSuccess: onSuccess,
    );
  }

  Future<void> signOut({required dynamic Function() onSuccess}) async {
    await oprManager.perform(
      operationName: 'Sign out',
      operation: (_) async => await authRepo.signOut(),
      onSuccess: onSuccess,
    );
  }
}

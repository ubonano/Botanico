import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:get/get.dart';

class SignOutController extends GetxController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'SignOutController';

  Future<void> signOut() async {
    return operationManager.perform(
      operationName: 'Sign out',
      operation: (_) async => await session.signOut(),
      onSuccess: navigate.toSignIn,
    );
  }
}

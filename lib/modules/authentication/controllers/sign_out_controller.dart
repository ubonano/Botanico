import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class SignOutController extends GetxController with ContextController {
  @override
  String get logTag => 'SignOutController';

  Future<void> signOut() async {
    await auth.signOut(
      onSuccess: navigate.toSignIn,
    );
  }
}

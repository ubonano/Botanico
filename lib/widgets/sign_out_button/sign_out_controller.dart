import 'package:get/get.dart';
import '../../utils/custom_controller.dart';

class SignOutController extends GetxController with CustomController {
  @override
  String get logTag => 'SignOutController';

  Future<void> submit() async {
    return async.perform(
      operationName: 'Sign out',
      operation: _handleOperation,
      onSuccess: navigate.toSignIn,
    );
  }

  Future<void> _handleOperation(_) async {
    await auth.signOut();

    workerService.clean();
    companyService.clean();
  }
}

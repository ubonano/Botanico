import 'package:get/get.dart';
import '../../services/custom_controller.dart';

class SignOutController extends GetxController with CustomController {
  @override
  String get logTag => 'SignOutController';

  Future<void> signOut() async => async.perform(
      operationName: 'Sign out',
      operation: (_) async {
        await auth.signOut();

        workerService.clean();
        companyService.clean();
      },
      onSuccess: navigate.toSignIn);
}

import 'package:botanico/modules/foundation/services/common_services.dart';
import 'package:get/get.dart';
import '../../foundation/utils/log_lifecycle.dart';

class SignOutController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'SignOutController';

  Future<void> signOut() async => asyncOperationService.performOperation(
        operationName: 'Sign out',
        operation: authService.signOut,
        onSuccess: () {
          userProfileService.clean();
          companyProfileService.clean();
          navigationService.toSignIn();
        },
      );
}

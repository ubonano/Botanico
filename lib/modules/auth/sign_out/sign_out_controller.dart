import 'package:botanico/modules/foundation/services/common_services.dart';
import 'package:get/get.dart';
import '../../foundation/utils/log_lifecycle.dart';

class SignOutController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'SignOutController';

  Future<void> signOut() async => asyncOperationService.performOperation(
        operation: () => authService.signOut(),
        operationName: 'Sign out',
        onSuccess: () {
          userProfileService.cleanUserProfile();
          companyProfileService.cleanCompanyProfile();
          navigationService.toSignIn();
        },
      );
}

import 'package:botanico/modules/foundation/services/common_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../foundation/utils/log_lifecycle.dart';

class SignInController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'SignInController';

  final emailController = TextEditingController();
  final emailRecoverController = TextEditingController();
  final passwordController = TextEditingController();

  String get _email => emailController.text.trim();
  String get _emailRecover => emailRecoverController.text.trim();
  String get _password => passwordController.text.trim();

  Future<void> signIn() async => await asyncOperationService.performOperation(
        operation: () => authService.signInWithEmailAndPassword(_email, _password),
        operationName: 'Sign in',
        onSuccess: () async {
          await userProfileService.fetchUserProfile(authService.currentUser!.uid);
          await companyProfileService.fetchCompanyProfile(authService.currentUser!.uid);

          if (!userProfileService.hasUserProfile) {
            navigationService.toUserProfile();
          }

          if (userProfileService.hasUserProfile && !companyProfileService.hasCompanyProfile) {
            navigationService.toLobby();
          }

          if (userProfileService.hasUserProfile && companyProfileService.hasCompanyProfile) {
            navigationService.toHome();
          }
        },
      );

  void recoverPassword() async {
    await asyncOperationService.performOperation(
      operation: () => authService.recoverPassword(_emailRecover),
      operationName: 'Recover password',
    );

    navigationService.back();
  }

  void navigateToSignUp() => navigationService.toSignUp();

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  void disposeControllers() {
    emailController.dispose();
    emailRecoverController.dispose();
    passwordController.dispose();
  }
}

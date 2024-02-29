import 'package:botanico/modules/foundation/services/common_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../foundation/utils/log_lifecycle.dart';

class SignInController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'SignInController';

  final signInFormKey = GlobalKey<FormState>();
  final recoverPasswordFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final emailRecoverController = TextEditingController();
  final passwordController = TextEditingController();

  String get _email => emailController.text.trim();
  String get _emailRecover => emailRecoverController.text.trim();
  String get _password => passwordController.text.trim();

  Future<void> signIn() async {
    if (!signInFormKey.currentState!.validate()) return;

    await asyncOperation.perform(
      operationName: 'Sign in',
      operation: () => auth.signIn(_email, _password),
      onSuccess: () async {
        await fetchUserProfile();
        await fetchCompanyProfile();

        if (userProfileService.hasUserProfile && companyProfileService.hasCompanyProfile) {
          navigate.toHome();
        }

        if (userProfileService.hasUserProfile && !companyProfileService.hasCompanyProfile) {
          navigate.toLobby();
        }

        if (!userProfileService.hasUserProfile) {
          navigate.toUserProfile();
        }
      },
    );
  }

  void recoverPassword() async {
    if (!recoverPasswordFormKey.currentState!.validate()) return;

    await asyncOperation.perform(
        operation: () => auth.recoverPassword(_emailRecover),
        operationName: 'Recover password',
        successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña');

    navigate.back();
  }

  Future<void> fetchUserProfile() async => await userProfileService.fetchById(auth.user!.uid);
  Future<void> fetchCompanyProfile() async =>
      await companyProfileService.fetchById(userProfileService.userProfile!.companyUid);

  void navigateToSignUp() => navigate.toSignUp();

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

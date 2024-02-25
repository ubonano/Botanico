import 'package:botanico/modules/foundation/utils/common_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../foundation/utils/log_lifecycle_controller.dart';

class SignInController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'SignInController';

  late TextEditingController emailController;
  late TextEditingController emailRecoverController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    emailRecoverController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    emailRecoverController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  void navigateToSignUp() => navigationService.navigateToSignUp();

  void signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    await authService.signInWithEmailAndPassword(email, password);
  }

  void recoverPassword() async {
    final emailRecover = emailRecoverController.text.trim();
    navigationService.goBack();
    await authService.recoverPassword(emailRecover);
  }
}

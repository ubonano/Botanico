import 'package:botanico/modules/foundation/services/common_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../foundation/utils/log_lifecycle.dart';

class SignInController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'SignInController';

  late TextEditingController emailController;
  late TextEditingController emailRecoverController;
  late TextEditingController passwordController;

  String get _email => emailController.text.trim();
  String get _emailRecover => emailRecoverController.text.trim();
  String get _password => passwordController.text.trim();

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

  void navigateToSignUp() => navigationService.toSignUp();

  void signIn() async => await asyncOperationService.performOperation(
        operation: () => authService.signInWithEmailAndPassword(_email, _password),
      );

  void recoverPassword() async {
    await asyncOperationService.performOperation(operation: () => authService.recoverPassword(_emailRecover));

    navigationService.goBack();
  }
}

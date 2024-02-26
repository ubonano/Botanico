import 'package:botanico/modules/foundation/services/common_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../foundation/utils/log_lifecycle.dart';

class SignUpPageController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'SignUpPageController';

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  String get _email => emailController.text.trim();
  String get _password => passwordController.text.trim();

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }

  void navigateToSignIn() => navigationService.toSignIn();

  void signUp() async => await asyncOperationService.performOperation(
        operation: () => authService.createUserWithEmailAndPassword(_email, _password),
      );
}

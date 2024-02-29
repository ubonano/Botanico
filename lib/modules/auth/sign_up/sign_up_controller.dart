import 'package:botanico/modules/foundation/services/common_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../foundation/utils/log_lifecycle.dart';

class SignUpPageController extends GetxController with CommonServices, LogLifecycleController {
  @override
  String get logTag => 'SignUpPageController';

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String get _email => emailController.text.trim();
  String get _password => passwordController.text.trim();

  void signUp() async {
    if (!formKey.currentState!.validate()) return;

    await asyncOperationService.performOperation(
      operationName: 'Sign up',
      operation: () => authService.signUpWithEmailAndPassword(_email, _password),
      onSuccess: navigationService.toUserProfile,
    );
  }

  void navigateToSignIn() => navigationService.toSignIn();

  @override
  void onClose() {
    disponseControllers();

    super.onClose();
  }

  void disponseControllers() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}

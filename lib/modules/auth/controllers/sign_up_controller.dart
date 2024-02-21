import 'package:botanico/config/common_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController with CommonServices {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

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

  void navigateToLogin() => navigationService.navigateToLogin();

  void signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    await sessionService.createUserWithEmailAndPassword(email, password);
  }
}

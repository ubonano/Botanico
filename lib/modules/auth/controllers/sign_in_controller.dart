import 'package:botanico/config/common_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with CommonServices {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  void navigateToSignUp() => navigationService.navigateToSignUp();

  void signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    await sessionService.signInWithEmailAndPassword(email, password);
  }
}

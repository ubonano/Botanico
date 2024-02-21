import 'package:botanico/config/common_services.dart';
import 'package:botanico/modules/auth/services/session_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with CommonServices {
  final SessionService _sessionService = Get.find();

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

    await _sessionService.signInWithEmailAndPassword(email, password);
  }
}

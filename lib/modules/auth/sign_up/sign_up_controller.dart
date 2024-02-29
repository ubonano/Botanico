import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../foundation/utils/log_lifecycle.dart';

class SignUpPageController extends GetxController with CustomController {
  @override
  String get logTag => 'SignUpPageController';

  final signUpformKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String get _email => emailController.text.trim();
  String get _password => passwordController.text.trim();

  void signUp() async {
    if (!signUpformKey.currentState!.validate()) return;

    await asyncOperation.perform(
      operationName: 'Sign up',
      operation: () => auth.signUp(_email, _password),
      onSuccess: navigate.toUserProfile,
    );
  }

  void navigateToSignIn() => navigate.toSignIn();

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

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';

class SignUpController extends GetxController with CustomController {
  @override
  String get logTag => 'SignUpController';

  final signUpformKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  String get _email => emailCtrl.text.trim();
  String get _password => passwordCtrl.text.trim();

  void signUp() async {
    if (!signUpformKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Sign up',
      operation: (_) async => await auth.signUp(_email, _password),
      onSuccess: navigate.toWorkerCreate,
    );
  }

  void navigateToSignIn() => navigate.toSignIn();

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  void disposeControllers() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
  }
}

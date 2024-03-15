import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../services/custom_controller.dart';

class SignInController extends GetxController with CustomController {
  @override
  String get logTag => 'SignInController';

  final signInFormKey = GlobalKey<FormState>();
  final recoverPasswordFormKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final emailRecoverCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  String get _email => emailCtrl.text.trim();
  String get _emailRecover => emailRecoverCtrl.text.trim();
  String get _password => passwordCtrl.text.trim();

  void navigateToSignUp() => navigate.toSignUp();

  Future<void> signIn() async {
    if (!signInFormKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Sign in',
      operation: (_) async => await auth.signIn(_email, _password),
      onSuccess: () async {
        await fetchWorker();
        await fetchCompany();

        if (isWorkerLoaded && isCompanyLoaded) {
          navigate.toHome();
        }

        if (isWorkerLoaded && !isCompanyLoaded) {
          navigate.toLobby();
        }

        if (!isWorkerLoaded) {
          navigate.toWorkerCreate();
        }
      },
    );
  }

  void recoverPassword() async {
    if (!recoverPasswordFormKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) => auth.recoverPassword(_emailRecover),
      onSuccess: () => navigate.back(),
    );
  }

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  void disposeControllers() {
    emailCtrl.dispose();
    emailRecoverCtrl.dispose();
    passwordCtrl.dispose();
  }
}

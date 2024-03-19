import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';

class SignInController extends GetxController with CustomController {
  @override
  String get logTag => 'SignInController';

  final formKey = GlobalKey<FormState>();

  final textCtrls = List.generate(3, (_) => TextEditingController());

  List<String> get _fieldValues => textCtrls.map((ctrl) => ctrl.text.trim()).toList();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Sign in',
      operation: _handleOperation,
      onSuccess: _onSuccessOperation,
    );
  }

  Future<void> _handleOperation(_) async => await auth.signIn(_fieldValues[0], _fieldValues[1]);

  void _onSuccessOperation() async {
    await fetchWorker();
    await fetchCompany();

    if (loggedInWorkerIsLoaded && loggedInCompanyIsLoaded) {
      navigate.toHome();
    }

    if (loggedInWorkerIsLoaded && !loggedInCompanyIsLoaded) {
      navigate.toLobby();
    }

    if (!loggedInWorkerIsLoaded) {
      navigate.toWorkerCreate();
    }
  }

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  // ignore: avoid_function_literals_in_foreach_calls
  void disposeControllers() => textCtrls.forEach((controller) => controller.dispose());

  void navigateToSignUp() => navigate.toSignUp();
}

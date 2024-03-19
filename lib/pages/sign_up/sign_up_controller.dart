import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';

class SignUpController extends GetxController with CustomController {
  @override
  String get logTag => 'SignUpController';

  final signUpformKey = GlobalKey<FormState>();
  final textCtrls = List.generate(3, (_) => TextEditingController());
  List<String> get _fieldValues => textCtrls.map((ctrl) => ctrl.text.trim()).toList();

  void signUp() async {
    if (!signUpformKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Sign up',
      operation: _handleOperation,
      onSuccess: navigate.toWorkerCreate,
    );
  }

  Future<void> _handleOperation(_) async => await auth.signUp(_fieldValues[0], _fieldValues[1]);

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  // ignore: avoid_function_literals_in_foreach_calls
  void disposeControllers() => textCtrls.forEach((controller) => controller.dispose());

  void navigateToSignIn() => navigate.toSignIn();
}

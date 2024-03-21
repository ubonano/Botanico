import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';

class SignUpController extends GetxController with CustomController {
  @override
  String get logTag => 'SignUpController';

  @override
  // ignore: overridden_fields
  List<String> formFields = [
    'email',
    'password',
    'passwordConfirm',
  ];

  final formKey = GlobalKey<FormState>();

  void signUp() async {
    if (formKey.currentState!.validate()) {
      await async.perform(
        operationName: 'Sign up',
        operation: (_) async => await auth.signUp(
          getFieldValue('email'),
          getFieldValue('password'),
        ),
        onSuccess: navigate.toWorkerCreate,
      );
    }
  }
}

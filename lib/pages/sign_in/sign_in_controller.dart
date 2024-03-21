import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';

class SignInController extends GetxController with CustomController {
  @override
  String get logTag => 'SignInController';

  @override
  // ignore: overridden_fields
  Map<String, TextEditingController> textControllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  final formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Sign in',
      operation: (_) async => await auth.signIn(
        getFieldValue('email'),
        getFieldValue('password'),
      ),
      onSuccess: () async {
        await fetchWorker();
        await fetchCompany();

        if (currentWorkerIsLoaded && currentCompanyIsLoaded) navigate.toHome();
        if (currentWorkerIsLoaded && !currentCompanyIsLoaded) navigate.toLobby();
        if (!currentWorkerIsLoaded) navigate.toWorkerCreate();
      },
    );
  }
}

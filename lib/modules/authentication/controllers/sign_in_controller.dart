import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'SignInController';

  @override
  List<String> formFields = ['email', 'password'];

  @override
  Future<void> submit() async {
    await operationManager.perform(
      operationName: 'Sign in',
      operation: (_) async => await session.signIn(
        getFieldValue('email'),
        getFieldValue('password'),
      ),
      onSuccess: () async {
        if (session.workerIsLoaded && session.companyIsLoaded) navigate.toHome();
        if (session.workerIsLoaded && !session.companyIsLoaded) navigate.toLobby();
        if (!session.workerIsLoaded) navigate.toWorkerCreate();
      },
    );
  }
}

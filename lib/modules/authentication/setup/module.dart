import 'package:get/get.dart';

import '../../app/content/setup/interfaces/i_module_structure.dart';
import '../authentication_business_logic.dart';
import '../authentication_service.dart';
import '../authentication_repository.dart';
import '../ui/ui.dart';
import 'interfaces/i_authenticatin_business_logic.dart';
import 'interfaces/i_authentication_repository.dart';
import 'interfaces/i_authentication_service.dart';

class AuthenticationModule implements IModuleStructure {
  @override
  String get id => moduleId;
  static const String moduleId = 'authentication';

  @override
  String get label => moduleLabel;
  static const String moduleLabel = 'Autenticación';

  @override
  List<KeyModel> get keys => [];

  static void dependencies() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);

    Get.put<IAuthenticationBusinessLogic>(AuthenticationBusinessLogic(), permanent: true);

    Get.lazyPut<IAuthenticationRepository>(() => AuthenticationRepository(), fenix: true);
    Get.lazyPut<IAuthenticationService>(() => AuthenticationService(), fenix: true);

    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
    Get.lazyPut<SignInRecoverController>(() => SignInRecoverController(), fenix: true);
  }

  static final List<GetPage> pages = [
    SignInPage.page,
    SignUpPage.page,
  ];
}

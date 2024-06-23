import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../authentication_business_logic.dart';
import '../../authentication_service.dart';
import '../../authentication_repository.dart';
import '../../ui/ui.dart';
import 'interfaces/i_authenticatin_business_logic.dart';
import 'interfaces/i_authentication_repository.dart';
import 'interfaces/i_authentication_service.dart';

void setupDependencies() {
  Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);

  Get.put<IAuthenticationBusinessLogic>(AuthenticationBusinessLogic(), permanent: true);

  Get.lazyPut<IAuthenticationRepository>(() => AuthenticationRepository(), fenix: true);
  Get.lazyPut<IAuthenticationService>(() => AuthenticationService(), fenix: true);

  Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
  Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
  Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
  Get.lazyPut<SignInRecoverController>(() => SignInRecoverController(), fenix: true);
}

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

void authenticationDependencies() {
  Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);
  Get.put<FirebaseFirestore>(FirebaseFirestore.instance, permanent: true);

  Get.lazyPut<AuthRepository>(() => AuthRepository(), fenix: true);

  Get.lazyPut<PostSignInService>(() => PostSignInService(), fenix: true);
  Get.lazyPut<PostSignOutService>(() => PostSignOutService(), fenix: true);

  Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
  Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
  Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
  Get.lazyPut<PasswordRecoverController>(() => PasswordRecoverController(), fenix: true);
}

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

export 'core/controllers/password_recover_controller.dart';
export 'core/controllers/sign_in_controller.dart';
export 'core/controllers/sign_out_controller.dart';
export 'core/controllers/sign_up_controller.dart';

export 'core/repositories/auth_repository.dart';

export 'core/services/post_sign_in_service.dart';
export 'core/services/post_sign_out_service.dart';

export 'ui/widgets/recover_password_dialog.dart';
export 'ui/widgets/sign_out_button.dart';
export 'ui/widgets/sign_in_button.dart';
export 'ui/widgets/forgot_password_button.dart';
export 'ui/widgets/sign_up_button.dart';
export 'ui/widgets/to_sign_in_button.dart';
export 'ui/widgets/to_sign_up_button.dart';

export 'ui/sign_in_page.dart';
export 'ui/sign_up_page.dart';

export 'tests/flows/navigate_to_sign_in_flow.dart';
export 'tests/flows/navigate_to_sign_up_flow.dart';
export 'tests/flows/sign_out_from_worker_create_flow.dart';
export 'tests/flows/sign_in_flow.dart';
export 'tests/flows/sign_up_flow.dart';

export 'tests/sign_in/sign_in_navigate_to_sign_in_test.dart';
export 'tests/sign_in/sign_in_empty_fields_test.dart';
export 'tests/sign_in/sign_in_invalid_email_test.dart';
export 'tests/sign_in/sign_in_invalid_password_test.dart';
export 'tests/sign_in/sign_in_success_test.dart';
export 'tests/sign_in/sign_in_wrong_password_test.dart';

export 'tests/sign_out/sign_in_sign_out_test.dart';

export 'tests/sign_up/sign_up_navigate_to_sign_in_test.dart';
export 'tests/sign_up/sign_up_empty_fields_test.dart';
export 'tests/sign_up/sign_up_invalid_email_test.dart';
export 'tests/sign_up/sign_up_invalid_password_test.dart';
export 'tests/sign_up/sign_up_invalid_confirm_password_test.dart';
export 'tests/sign_up/sign_up_success_test.dart';
export 'tests/sign_up/sign_up_used_email_test.dart';

export 'tests/authentication_test.dart';

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

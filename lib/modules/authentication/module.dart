import 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_auth/firebase_auth.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:get/get.dart';

export 'core/business_logic/authentication_business_logic.dart';

export 'ui/controllers/sign_in_recover_controller.dart';
export 'ui/controllers/sign_in_controller.dart';
export 'ui/controllers/sign_out_controller.dart';
export 'ui/controllers/sign_up_controller.dart';

export 'core/helpers/interfaces/i_authenticatin_business_logic.dart';
export 'core/helpers/interfaces/i_authentication_service.dart';
export 'core/helpers/interfaces/i_authentication_repository.dart';
export 'core/helpers/authentication_navigate_helper.dart';

export 'core/repositories/authentication_repository.dart';

export 'core/services/authentication_service.dart';

export 'ui/widgets/fields/confirm_password_input_field.dart';
export 'ui/widgets/fields/email_input_field.dart';
export 'ui/widgets/fields/password_input_field.dart';

export 'ui/widgets/sign_in_recover_dialog.dart';
export 'ui/widgets/sign_out_button.dart';
export 'ui/widgets/sign_in_button.dart';
export 'ui/widgets/sign_in_recover_button.dart';
export 'ui/widgets/sign_up_button.dart';
export 'ui/widgets/sign_in_navigate_button.dart';
export 'ui/widgets/sign_up_navigate_button.dart';

export 'ui/sign_in_page.dart';
export 'ui/sign_up_page.dart';

export 'tests/flows/sign_in_navigate_flow.dart';
export 'tests/flows/sign_up_navigate_flow.dart';
export 'tests/flows/sign_out_flow.dart';
export 'tests/flows/sign_in_flow.dart';
export 'tests/flows/sign_up_flow.dart';

export 'tests/pages/sign_in/sign_in_navigate_sign_up_test.dart';
export 'tests/pages/sign_in/sign_in_empty_fields_test.dart';
export 'tests/pages/sign_in/sign_in_invalid_email_test.dart';
export 'tests/pages/sign_in/sign_in_invalid_password_test.dart';
export 'tests/pages/sign_in/sign_in_success_test.dart';
export 'tests/pages/sign_in/sign_in_wrong_password_test.dart';

export 'tests/pages/sign_out/sign_out_test.dart';

export 'tests/pages/sign_up/sign_up_navigate_sign_in_test.dart';
export 'tests/pages/sign_up/sign_up_empty_fields_test.dart';
export 'tests/pages/sign_up/sign_up_invalid_email_test.dart';
export 'tests/pages/sign_up/sign_up_invalid_password_test.dart';
export 'tests/pages/sign_up/sign_up_invalid_confirm_password_test.dart';
export 'tests/pages/sign_up/sign_up_success_test.dart';
export 'tests/pages/sign_up/sign_up_already_used_email_test.dart';

export 'tests/module_test.dart';

void dependencies() {
  Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);
  Get.put<FirebaseFirestore>(FirebaseFirestore.instance, permanent: true);

  Get.lazyPut<IAuthenticationRepository>(() => AuthenticationRepository(), fenix: true);
  Get.lazyPut<IAuthenticationBusinessLogic>(() => AuthenticationBusinessLogic(), fenix: true);
  Get.lazyPut<IAuthenticationService>(() => AuthenticationService(), fenix: true);

  Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
  Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
  Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
  Get.lazyPut<SignInRecoverController>(() => SignInRecoverController(), fenix: true);
}

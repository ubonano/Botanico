import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

mixin AuthenticationContext {
  late final AuthenticationRepository authRepo = Get.find();

  User? get currentUser => authRepo.user;
}

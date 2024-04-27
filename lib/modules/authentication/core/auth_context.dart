import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:get/get.dart';

mixin AuthContext {
  late final AuthRepository authRepo = Get.find();
}
// agregar ete mixin en todos lados donde se llame a authRepo
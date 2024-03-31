import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

mixin ContextService on GetxService {
  late final FirebaseFirestore firestore = Get.find();
  late final AuthService auth = Get.find();
  late final OperationManagerService operationManager = Get.find();
}

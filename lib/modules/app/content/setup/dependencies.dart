import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../ui/ui.dart';
import '../helpers/log_helper.dart';
import '../helpers/operation_helper.dart';
import '../helpers/snackbar_helper.dart';
import '../model/module_repository.dart';

void setupDependencies() {
  Get.put<FirebaseFirestore>(FirebaseFirestore.instance, permanent: true);

  Get.lazyPut<AppNavigation>(() => AppNavigation(), fenix: true);
  Get.lazyPut<LogHelper>(() => LogHelper(), fenix: true);
  Get.lazyPut<SnackbarHelper>(() => SnackbarHelper(), fenix: true);
  Get.lazyPut<OperationHelper>(() => OperationHelper(), fenix: true);

  Get.lazyPut<ModuleRepository>(() => ModuleRepository(), fenix: true);

  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  Get.lazyPut<LoadingController>(() => LoadingController(), fenix: true);
}

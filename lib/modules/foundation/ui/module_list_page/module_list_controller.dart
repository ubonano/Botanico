import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

class ModuleListController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ModuleListController';

  late final ModuleRepository _moduleRepo = Get.find();

  List<ModuleModel> get modules$ => _moduleRepo.modules$;
}

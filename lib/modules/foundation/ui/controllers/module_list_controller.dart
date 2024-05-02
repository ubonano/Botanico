import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class ModuleListController extends GetxController with LifeCycleLoggingControllerHelper, GlobalHelper {
  @override
  String get logTag => 'ModuleListController';

  late final ModuleRepository _moduleService = Get.find();

  List<ModuleModel> get modules$ => _moduleService.modules$;
}

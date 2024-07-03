import 'package:get/get.dart';

import '../../worker_business_logic.dart';
import '../../worker_service.dart';
import '../model/linked_worker_repository.dart';
import '../../worker_repository.dart';
import '../../ui/ui.dart';
import '../../../app/content/setup/interfaces/i_module_structure.dart';
export '../../../app/content/setup/interfaces/i_module_structure.dart';
import 'interfaces/i_linked_worker_repository.dart';
import 'interfaces/i_worker_business_logic.dart';
import 'interfaces/i_worker_repository.dart';
import 'interfaces/i_worker_service.dart';
import 'module.dart';

class WorkerModule implements IModuleStructure {
  @override
  String get id => moduleId;
  static const String moduleId = 'worker';

  @override
  String get label => moduleLabel;
  static const String moduleLabel = 'Trabajadores';

  @override
  List<KeyModel> get keys => WorkerKeys.values.map((key) => KeyModel(id: key.id, label: key.label)).toList();

  static void dependencies() {
    Get.put<WorkerModule>(WorkerModule(), permanent: true);

    Get.put<IWorkerBusinessLogic>(WorkerBusinessLogic(), permanent: true);
    Get.put<IWorkerRepository>(WorkerRepository(), permanent: true);
    Get.put<ILinkedWorkerRepository>(LinkedWorkerRepository(), permanent: true);
    Get.put<IWorkerService>(WorkerService(), permanent: true);

    Get.lazyPut<WorkerPermissionManagementController>(() => WorkerPermissionManagementController(), fenix: true);
    Get.lazyPut<WorkerLobbyController>(() => WorkerLobbyController(), fenix: true);
    Get.lazyPut<WorkerFormController>(() => WorkerFormController(), fenix: true);
    Get.lazyPut<WorkerListController>(() => WorkerListController(), fenix: true);
    Get.lazyPut<WorkerLinkController>(() => WorkerLinkController(), fenix: true);
    Get.lazyPut<WorkerLinkController>(() => WorkerLinkController(), fenix: true);
    Get.lazyPut<WorkerPermissionToggleController>(() => WorkerPermissionToggleController(), fenix: true);
  }

  static final List<GetPage> pages = [
    LobbyPage.page,
    WorkerFormPage.page,
    WorkerListPage.page,
    WorkerLinkPage.page,
    WorkerPermissionManagementPage.page,
  ];
}

enum WorkerKeys {
  view('${WorkerModule.moduleId}.view', 'Ver'),
  link('${WorkerModule.moduleId}.link', 'Vincular'),
  unlink('${WorkerModule.moduleId}.unlink', 'Desvincular'),
  managePermissions('${WorkerModule.moduleId}.managePermissions', 'Gestionar permisos');

  final String id;
  final String label;

  const WorkerKeys(this.id, this.label);
}

import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../../setup/interfaces/i_worker_service.dart';

class WorkerPermissionToggleController extends GetxController with LifeCycleLoggingControllerHelper, GlobalHelper {
  @override
  String get logTag => 'PermissionToggleController';

  late final IWorkerService _workerService = Get.find();

  final _worker = Rx<WorkerModel?>(null);

  WorkerModel? get worker$ => _worker.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchCurWorkerForUpdate();
  }

  Future<void> fetchCurWorkerForUpdate() async {
    final workerId = Get.arguments;

    if (workerId == null) throw Exception('No se encontro trabajador parametrizado');
    _worker.value = await _workerService.get(workerId);
  }

// Refactorizar esto... Si no se modifica la instancia de la clase, no se actualiza la parte visual
// por ahora funciona asi, ya que al hacer el get, la isntancia es nueva
// solamente que se modifique la lsita de permisos no es suficiente para que lo detecte el OBX
  Future<void> togglePermission(String permissionId) async {
    WorkerModel? worker = worker$;

    worker!.togglePermission(permissionId);

    await _workerService.update(worker);
    _worker.value = await _workerService.get(worker.uid);
  }
}

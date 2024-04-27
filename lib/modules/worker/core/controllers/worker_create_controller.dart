import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerCreateController extends GetxController with FormController, LifeCycleLogging {
  @override
  String get logTag => 'WorkerCreateController';

  late final OperationManagerService _oprManager = Get.find();
  late final NavigationService _navigate = Get.find();
  late final AuthRepository _authRepo = Get.find();
  late final WorkerRepository _workerRepo = Get.find();

  @override
  List<String> formFields = [FieldKeys.fullname, FieldKeys.birthDate, FieldKeys.phone, FieldKeys.dni];

  @override
  Future<void> submit() async => await _createWorker(_newWorker);

  Future<void> _createWorker(WorkerModel worker) async {
    await _oprManager.perform(
      operationName: 'Create worker',
      operation: (_) async => await _workerRepo.createWorker(worker),
      onSuccess: _navigate.toLobby,
    );
  }

  WorkerModel get _newWorker => WorkerModel(
        uid: _authRepo.user?.uid ?? '',
        email: _authRepo.user?.email ?? '',
        name: getFieldValue(FieldKeys.fullname),
        birthDate: getFieldValue(FieldKeys.birthDate),
        phone: getFieldValue(FieldKeys.phone),
        dni: getFieldValue(FieldKeys.dni),
      );
}

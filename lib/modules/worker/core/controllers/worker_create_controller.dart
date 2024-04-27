import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class WorkerCreateController extends GetxController
    with FormController, LifeCycleLogging, GlobalServices, AuthContext, WorkerContext {
  @override
  String get logTag => 'WorkerCreateController';

  @override
  List<String> formFields = [FieldKeys.fullname, FieldKeys.birthDate, FieldKeys.phone, FieldKeys.dni];

  @override
  Future<void> submit() async => await _createWorker(_newWorker);

  Future<void> _createWorker(WorkerModel worker) async {
    await oprManager.perform(
      operationName: 'Create worker',
      operation: (_) async => await workerRepo.createWorker(worker),
      onSuccess: navigate.toLobby,
    );
  }

  WorkerModel get _newWorker => WorkerModel(
        uid: authRepo.user?.uid ?? '',
        email: authRepo.user?.email ?? '',
        name: getFieldValue(FieldKeys.fullname),
        birthDate: getFieldValue(FieldKeys.birthDate),
        phone: getFieldValue(FieldKeys.phone),
        dni: getFieldValue(FieldKeys.dni),
      );
}
